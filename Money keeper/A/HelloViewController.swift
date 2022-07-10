//
//  HelloViewController.swift
//  Money keeper
//
//  Created by Влад Бокин on 10.07.2022.
//

import UIKit

class HelloViewController: UIViewController {
    let defauls = UserDefaults.standard
    
    @IBOutlet weak var helloLabelOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
        let userName = Base.shared.userNames
        guard let currentUserFirstName: String = userName.first?.firstName else { return }
        guard let currentUserLastName: String = userName.first?.lastName else { return }
        
        helloLabelOutlet.text = "Hello \(currentUserFirstName) \(currentUserLastName)!"
    }
    
}
