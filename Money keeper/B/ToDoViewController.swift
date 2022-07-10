//
//  ToDoViewController.swift
//  Money keeper
//
//  Created by Влад Бокин on 10.07.2022.
//

import UIKit

class ToDoViewController: UIViewController {
    
    var tasks: [Tasks] = []
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        addTaskAlert(title: "To-do", message: "Write task", style: .alert)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
    }
    
    
    func addTaskAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let newTask = alertController.textFields?.first?.text
            
            if (newTask != nil){
                self.tasks.insert(newTask!, at: 0)
                self.tableViewOutlet.reloadData()
            } else {
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row ]
        return cell
    }
    
    
}
