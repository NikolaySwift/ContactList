//
//  ViewController.swift
//  ContactList
//
//  Created by NikolayD on 24.07.2024.
//

import UIKit

final class ContactListViewController: UITableViewController {
    
    var personList: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Back"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactDetailsVC = segue.destination as? ContactDetailsViewController else {
            return
        }
        guard let currentIndex = tableView.indexPathForSelectedRow else { return }
        contactDetailsVC.person = personList[currentIndex.row]
    }

}

// MARK: - UITableViewDataSource
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = personList[indexPath.row].fullName
        cell.contentConfiguration = content
        
        return cell
    }
}
