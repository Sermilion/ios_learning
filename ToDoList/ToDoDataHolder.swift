//
//  ToDoDataHolder.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import Foundation

protocol ListDataHolder: AnyObject {
    
//    associatedtype T
    
    func addItem(item: ToDo)
    
    func reloadData()
}
