//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    // how to tell ListDataHolder ot use ToDo is its generic type?
    weak var toDoDataHolder: ListDataHolder? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAddClicked(_ sender: Any) {
        let toDo = ToDo()
        toDo.priority = prioritySegment.selectedSegmentIndex
        if let name = nameTextField.text {
            toDo.name = name
        }
        toDoDataHolder?.addItem(item: toDo)
        toDoDataHolder?.reloadData()
        navigationController?.popViewController(animated: true)
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
