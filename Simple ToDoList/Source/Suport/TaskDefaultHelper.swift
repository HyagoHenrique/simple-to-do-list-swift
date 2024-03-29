//
//  TaskDefaultHelper.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import Foundation

class TaskDefaultHelper {
    
    let kTask: String = "kTask"
    
    public func saveTaskList(list: [Task]) {
        do {
            let listAux = try JSONEncoder().encode(list)
            UserDefaults.standard.setValue(listAux, forKey: self.kTask)
        } catch {
           print(error)
        }
    }
    
    public func getTaskList() -> [Task]{
        do {
            guard let list = UserDefaults.standard.object(forKey: self.kTask) else { return [] }
            let listAux = try JSONDecoder().decode([Task].self, from: list as! Data)
            return listAux
        } catch {
            print(error)
        }
        return []
    }
    
    public func updateTaskList(task: Task) {
        var list: [Task] =  self.getTaskList()
        list.removeAll { taskList in
            return taskList.id == task.id
        }
        list.append(task)
        self.saveTaskList(list: list)
    }
    
    public func excludeTask(task: Task) {
        var list: [Task] =  self.getTaskList()
        list.removeAll { taskList in
            return taskList.id == task.id
        }
        self.saveTaskList(list: list)
    }
    
    public func getNextId() -> Int {
        let list: [Task] = self.getTaskList()
        for index in 0...list.count {
            let listAux = list.filter { $0.id == index }
            if listAux.count == 0 {
                return index
            }
        }
        return 0
    }
    
}
