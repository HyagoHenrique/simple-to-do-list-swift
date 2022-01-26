//
//  ListTaskController.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import UIKit

class ListTaskController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var btnAdd: UIButton!
    
    
    //MARK: Var/Let
    private var list: [Task] = []
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ManagerTaskTableController {
            guard let task = sender as? Task else { return }
            controller.task = task
        }
    }
    
    //MARK: Private/Public Func
    
    private func registerNib() {
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    private func loadList() {
        self.list = TaskDefaultHelper().getTaskList()
        self.tableView.reloadData()
    }
    
    private func callCreateTask(task: Task?) {
        self.performSegue(withIdentifier: "CreateNewTaskSegue", sender: task)
    }
    
    //MARK: Action
    @IBAction func addNewTask(_ sender: Any) {
        self.callCreateTask(task: nil)
    }
}

extension ListTaskController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count > 0 ? self.list.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.list.count > 0 {
            let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
            let task: Task = self.list[indexPath.row]
            cell.setDate(date: task.date)
            cell.setHour(hour: task.hour)
            cell.setTitle(title: task.title)
            
            return cell
        } else {
            let cell: EmptyTableCell = tableView.dequeueReusableCell(withIdentifier: "emptyTableCell", for: indexPath) as! EmptyTableCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.list.count > 0 ? 109 : 151
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.list.count > 0 {
            self.callCreateTask(task: self.list[indexPath.row])
        } else {
            self.callCreateTask(task: nil)
        }
    }
}
