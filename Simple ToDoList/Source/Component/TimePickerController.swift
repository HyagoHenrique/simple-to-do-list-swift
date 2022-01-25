//
//  TimePickerController.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import UIKit

protocol TimePickerProtocol {
    func sendHours(hours: String)
}

class TimePickerController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnOk: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    //MARK: Var/Lets
    public var delegate: TimePickerProtocol?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: IBAction
    @IBAction func close(_ sender : UIButton) {
        if sender == self.btnOk {
            self.dismiss(animated: true) {
                guard let delegate = self.delegate else { return }
                let datePickerSelect: Date = self.datePicker.date
                let dateString: String = Date().convertDateToString(date: datePickerSelect, dateFormatter: "HH:mm")
                delegate.sendHours(hours: dateString)
            }
        } else {
            self.dismiss(animated: true)
        }
    }
    
}
