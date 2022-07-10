//
//  RegistrationViewController.swift
//  Money keeper
//
//  Created by Влад Бокин on 10.07.2022.
//

import UIKit


class RegistrationViewController: UIViewController {
   
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var firstNameLabelOutlet: UITextField!
    
    @IBOutlet weak var lastNameLabelOutlet: UITextField!
    
    @IBOutlet weak var registerButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userName = Base.shared.userNames
        firstNameLabelOutlet.text = userName.first?.firstName
        lastNameLabelOutlet.text = userName.first?.lastName
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        
        let firstName = firstNameLabelOutlet.text!
        let lastName = lastNameLabelOutlet.text!
        
        if !firstName.isEmpty && !lastName.isEmpty {
            Base.shared.saveUserData(firstName: firstName, lastName: lastName)
            performSegue(withIdentifier: "mySegue", sender: nil)
        } else {
            return emptyErrorAlert(title: "Error", message: "TextField is empty", style: .alert)
        }
        
        func emptyErrorAlert(title: String, message: String, style: UIAlertController.Style){
                let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
               
            let action = UIAlertAction(title: "OK", style: .default) {_ in }
               
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
    }
    
    
    
    
}
