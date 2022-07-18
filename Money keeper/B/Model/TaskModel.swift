//
//  TaskModel.swift
//  Money keeper
//
//  Created by Влад Бокин on 11.07.2022.
//

import Foundation
import RealmSwift

class ToDoTask: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var isCompleted = false
}

