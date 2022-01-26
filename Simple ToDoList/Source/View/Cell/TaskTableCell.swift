//
//  TaskTableCell.swift
//  Simple ToDoList
//
//  Created by Hyago Henrique on 25/01/22.
//

import UIKit

class TaskTableCell: UITableViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setTitle(title: String) {
        self.lblTitle.text =  title
    }
    public func setHour(hour: String) {
        self.lblHour.text =  hour
    }
    public func setDate(date: String) {
        self.lblDate.text =  date
    }
}
