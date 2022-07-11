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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TaskTableViewOutlet.delegate = self
        self.TaskTableViewOutlet.dataSource = self
    }
    
}

extension SecondToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
