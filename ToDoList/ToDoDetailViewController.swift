//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var toDoCD : ToDoCD? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDo = toDoCD {
            let name = toDo.name ?? "empty"
            if toDo.priority == 1 {
                toDoLabel.text = "❗️" + name
            } else if toDo.priority == 2 {
                toDoLabel.text = "‼️" + name
            } else{
                toDoLabel.text = toDo.name
            }
        }
    }
    
    @IBAction func onDoneClicked(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        if let context = appDelegate?.persistentContainer.viewContext {
            if let toDo = toDoCD {
                context.delete(toDo)
            }
            appDelegate?.saveContext()
        }
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
