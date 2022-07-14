//
//  SecondToDoListViewController.swift
//  Money keeper
//
//  Created by Влад Бокин on 11.07.2022.
//

import UIKit
import RealmSwift

class SecondToDoListViewController: UIViewController {
 
    @IBOutlet weak var TaskTableViewOutlet: UITableView!
    
    var userTasks = TaskList()
    let task = Task()
    
    let uiRealm = try! Realm()
    var lists : Results<TaskList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TaskTableViewOutlet.delegate = self
        self.TaskTableViewOutlet.dataSource = self
        
        self.userTasks.name = "MyTasks"
        
    }
    
    @IBAction func AddTaskButtonAction(_ sender: Any) {
        addTaskAlert(title: "Alert", message: "Write new task", style: .alert)
    }
    
    //MARK: - Alert
    func addTaskAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            let newTask = alertController.textFields?.first?.text
            
            if (newTask != nil){
                //add task
                try! uiRealm.write({ () -> Void in
                    newTask?.append(<#T##c: Character##Character#>)
                           
                        })
                
                try! uiRealm.write { () -> Void in
                    
                    self.task.name = newTask!
                    self.userTasks.tasks.append(self.task)
                            uiRealm.add(userTasks)
                    readAndUpdateIU()
                }
            } else {
                
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func readAndUpdateIU() {
        
        lists = uiRealm.objects(TaskList.self)
        self.TaskTableViewOutlet.setEditing(false, animated: true)
        self.TaskTableViewOutlet.reloadData()
    }
}


extension SecondToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lists.isEmpty == true{
            return 0
        } else {
            return lists.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let Mytask = lists[indexPath.row]
        cell.textLabel?.text = "\(Mytask.tasks[indexPath.row].name)"
        print(Mytask.tasks[indexPath.row].name)
        return cell
    }
    
    
}
