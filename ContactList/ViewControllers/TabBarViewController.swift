//
//  TabBarViewController.swift
//  ContactList
//
//  Created by NikolayD on 24.07.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isOpaque = true
        
        let personList = Person.getPersonList()
        viewControllers?.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                if let contactListVC = navigationVC.topViewController as? ContactListViewController {
                    contactListVC.personList = personList
                } else if let personListVC = navigationVC.topViewController as? PersonListViewController {
                    personListVC.personList = personList
                }
            }
        }
    }
}
