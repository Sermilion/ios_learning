//
//  ToDoTableTableViewController.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoCDs: [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()) {
                toDoCDs = toDosFromCoreData
                tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoCDs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedToDo = toDoCDs[indexPath.row]
        let name = selectedToDo.name ?? "empty"
        let priority = selectedToDo.priority
        
        switch priority {
        case 1:
            cell.textLabel?.text = "❗️\(name)"
        case 2:
            cell.textLabel?.text = "‼️\(name)"
        default:
            cell.textLabel?.text = "\(name)"
        }
        if let data = selectedToDo.image{
            cell.imageView?.image = UIImage(data:data)
        }
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
            if let context = appDelegate?.persistentContainer.viewContext {
                let selectedToDo = toDoCDs[indexPath.row]
                context.delete(selectedToDo)
                appDelegate?.saveContext()
                getToDos()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
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
        let selectedToDo = toDoCDs[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsToDoViewController = segue.destination as? ToDoDetailViewController {
            if let selectedToDo = sender as? ToDoCD {
                detailsToDoViewController.toDoCD = selectedToDo
            }
        }
    }
}
