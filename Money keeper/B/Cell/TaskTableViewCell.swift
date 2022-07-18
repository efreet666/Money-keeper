//
//  TaskTableViewCell.swift
//  Money keeper
//
//  Created by Влад Бокин on 18.07.2022.
//

import UIKit
import RealmSwift

class TaskTableViewCell: UITableViewCell {
    let vc = SecondToDoListViewController()
    let realm = try! Realm()
    
    @IBOutlet weak var taskNameLabelOutlet: UILabel!
    
    @IBOutlet weak var doneTaskButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func doneTaskButtonAction(_ sender: Any) {
        if currentTask?.isCompleted == true {
            let taskToUpdate = currentTask
            try! realm.write {
                taskToUpdate?.isCompleted = false
            }
            doneTaskButtonOutlet.setImage(UIImage(systemName: "poweroff"), for: .normal)
        } else {
            let taskToUpdate = currentTask
            try! realm.write {
                taskToUpdate?.isCompleted = true
            }
            doneTaskButtonOutlet.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    
    var currentTask: ToDoTask!
    
    func setupCell(task: ToDoTask) {
        
        taskNameLabelOutlet.text = task.name
        
        if task.isCompleted == true {
            doneTaskButtonOutlet.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            doneTaskButtonOutlet.setImage(UIImage(systemName: "poweroff"), for: .normal)
        }
        currentTask = task
        
    }
}
