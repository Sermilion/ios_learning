//
//  ToDo.swift
//  ToDoList
//
//  Created by Ibragim Gapuraev on 10/8/21.
//

import Foundation

class ToDo {
    var name: String
    var priority: Int
    
    init(name: String = "", priority: Int = 0) {
        self.name = name
        self.priority = priority
    }
}
