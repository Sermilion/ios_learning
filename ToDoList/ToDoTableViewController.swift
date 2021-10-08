//
//  ToDoTableTableViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class ToDoTableViewController: UITableViewController, ListDataHolder {
    
    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toDo1 = ToDo(
            name: "Write chapter one of iOS 14 book",
            priority: 0
        )
        
        let toDo2 = ToDo(
            name: "Edit iOS 14 book",
            priority: 1
        )
        
        toDos = [toDo1, toDo2]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addItem(item: ToDo) {
        toDos.append(item)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedToDo = toDos[indexPath.row]
        let priority = selectedToDo.priority
        
        switch priority {
        case 1:
            cell.textLabel?.text = "❗️\(selectedToDo.name)"
        case 2:
            cell.textLabel?.text = "‼️\(selectedToDo.name)"
        default:
            cell.textLabel?.text = "\(selectedToDo.name)"
        }
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addToDoViewController = segue.destination as? AddToDoViewController{
            addToDoViewController.toDoDataHolder = self
        }
        if let detailsToDoViewController = segue.destination as? ToDoDetailViewController {
            if let selectedToDo = sender as? ToDo{
                detailsToDoViewController.toDo = selectedToDo
            }
        }
    }
}
