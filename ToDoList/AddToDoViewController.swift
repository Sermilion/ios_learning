//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class AddToDoViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraClicked(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onPickClicked(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onAddClicked(_ sender: Any) {
        let addDelegate = (UIApplication.shared.delegate as? AppDelegate)
        if let context = addDelegate?.persistentContainer.viewContext {
            let newToDo = ToDoCD(context: context)
            newToDo.priority = Int32(prioritySegment.selectedSegmentIndex)
            if let name = nameTextField.text {
                newToDo.name = name
            }
            newToDo.image = imageView.image?.jpegData(compressionQuality: 1.0)
            addDelegate?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.originalImage] as? UIImage{
            imageView.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
