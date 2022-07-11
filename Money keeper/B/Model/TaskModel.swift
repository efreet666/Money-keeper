//
//  TaskModel.swift
//  Money keeper
//
//  Created by Влад Бокин on 11.07.2022.
//

import Foundation
import RealmSwift

class Task: Object {
    
    dynamic var name = ""
    dynamic var isCompleted = false
}

class TaskList: Object {
    
    dynamic var name = ""
    let tasks = List<Task>()
}
