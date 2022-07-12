//
//  TaskModel.swift
//  Money keeper
//
//  Created by Влад Бокин on 11.07.2022.
//

import Foundation
import RealmSwift

class Task: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var isCompleted = false
}

class TaskList: Object {
    
    @objc dynamic var name = ""
    let tasks = List<Task>()
}
