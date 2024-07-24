//
//  PersonListViewController.swift
//  ContactList
//
//  Created by NikolayD on 24.07.2024.
//

import UIKit

final class PersonListViewController: UITableViewController {
    
    var personList: [Person]!

}

// MARK: - UITableViewDelegate
extension PersonListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension PersonListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = personList[indexPath.section].phoneNumber
        } else {
            content.image = UIImage(systemName: "envelope")
            content.text = personList[indexPath.section].email
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullName
    }
}
