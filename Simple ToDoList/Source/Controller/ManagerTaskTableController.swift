//
//  ManagerTaskTableController.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import UIKit
import FSCalendar

class ManagerTaskTableController: UITableViewController {

    //MARK: IBOutlet
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var btnHour: UIButton!
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var btnRemove: UIButton!
    
    //MARK: Var/Let
    var hours: String = ""
    var date: String = ""
    public var task: Task?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.delegate = self
        self.configView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerController {
            controller.delegate = self
        }
    }
    
    //MARK: IBAction
    @IBAction func openComponent(_ sender: Any) {
        self.performSegue(withIdentifier: "segueComponentHours", sender: nil)
    }
    @IBAction func excludeTask(_ sender: Any) {
        TaskDefaultHelper().excludeTask(task: self.task!)
        self.dismiss(animated: true)
    }
    @IBAction func createTask(_ sender: Any) {
        self.createTask()
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //MARK: Func
    
    private func configView() {
        self.btnRemove.isHidden = self.task == nil
        guard let taskAux = self.task else { return }
        self.btnHour.setTitle(taskAux.hour, for: .normal)
        self.txtTitle.text =  taskAux.title
        self.date = taskAux.date
        self.hours = taskAux.hour
    }
    
    private func createTask() {
        if self.task != nil {
            self.task!.date = self.date
            self.task!.hour = self.hours
            self.task!.title = self.txtTitle.text!
            TaskDefaultHelper().updateTaskList(task: self.task!)
        } else {
            var list: [Task] = TaskDefaultHelper().getTaskList()
            let task: Task = Task(id: TaskDefaultHelper().getNextId(), title: self.txtTitle.text ?? "No Title", hour: self.hours, date: self.date)
            list.append(task)
            TaskDefaultHelper().saveTaskList(list: list)
        }
        self.dismiss(animated: true)
    }
}

extension ManagerTaskTableController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == dateAux {
                return .green
            }
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == dateAux {
                return .black
            }
        }
        return nil
    }
}

extension  ManagerTaskTableController: TimePickerProtocol {
    func sendHours(hours: String) {
        self.btnHour.setTitle(hours, for: .normal)
        self.hours = hours
    }
}

extension ManagerTaskTableController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
