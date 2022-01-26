//
//  Task.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import Foundation

class Task: Codable {
    var id: Int
    var title: String
    var hour: String
    var date: String
    
    init(id: Int, title: String, hour: String, date: String){
        self.id = id
        self.title = title
        self.hour = hour
        self.date = date
    }
}
