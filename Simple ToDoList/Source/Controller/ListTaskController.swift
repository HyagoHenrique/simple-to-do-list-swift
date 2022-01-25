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
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
    }
    
    //MARK: Private/Public Func
    
    private func registerNib() {
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    //MARK: Action
    @IBAction func addNewTask(_ sender: Any) {
        self.performSegue(withIdentifier: "CreateNewTaskSegue", sender: nil)
    }
}

extension ListTaskController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
        let cell: EmptyTableCell = tableView.dequeueReusableCell(withIdentifier: "emptyTableCell", for: indexPath) as! EmptyTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //109
        return 151
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("xablau")
    }
}
