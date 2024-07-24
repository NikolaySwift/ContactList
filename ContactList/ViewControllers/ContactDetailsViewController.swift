//
//  ContactDetailsViewController.swift
//  ContactList
//
//  Created by NikolayD on 24.07.2024.
//

import UIKit

final class ContactDetailsViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = person.fullName
        phoneLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
