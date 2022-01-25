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
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.delegate = self
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
    }
    @IBAction func createTask(_ sender: Any) {
    }
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension ManagerTaskTableController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
    }
}

extension  ManagerTaskTableController: TimePickerProtocol {
    func sendHours(hours: String) {
        self.btnHour.setTitle(hours, for: .normal)
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
