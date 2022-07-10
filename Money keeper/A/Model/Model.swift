//
//  Model.swift
//  Money keeper
//
//  Created by Влад Бокин on 10.07.2022.
//

import Foundation

class Base {
    
    static let shared = Base()
    
    let defaults = UserDefaults.standard
    
    struct UserNameModel: Codable {
        var firstName: String
        var lastName: String
    }
    
    var userNames: [UserNameModel] {
        get {
            if let data = defaults.value(forKey: "userNames") as? Data {
                return try! PropertyListDecoder().decode([UserNameModel].self, from: data)
            } else {
                return [UserNameModel]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "userNames")
            }
        }
    }
    
    func saveUserData(firstName: String, lastName: String) {
        let userData = UserNameModel(firstName: firstName, lastName: lastName)
        userNames.insert(userData, at: 0)
     
    }
}
