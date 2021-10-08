//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    
    var toDo: ToDo = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDo.priority == 1 {
            toDoLabel.text = "❗️" + toDo.name
            
        } else if toDo.priority == 2 {
            toDoLabel.text = "‼️" + toDo.name
            
        } else{
            toDoLabel.text = toDo.name
        }
    }
    
    @IBAction func onDoneClicked(_ sender: Any) {
        
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
