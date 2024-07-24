//
//  Person.swift
//  ContactList
//
//  Created by NikolayD on 24.07.2024.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersonList() -> [Person] {
        var personList: [Person] = []
        let dataStore = DataStore()
        
        let nameAndSurnameList = zip(
            dataStore.names.shuffled(),
            dataStore.surnames.shuffled()
        )
        let phoneAndEmailList = zip(
            dataStore.phones.shuffled(),
            dataStore.emails.shuffled()
        )
        
        for (nameAndSurname, phoneAndEmail) in zip(nameAndSurnameList, phoneAndEmailList) {
            personList.append(
                Person(
                    name: nameAndSurname.0,
                    surname: nameAndSurname.1,
                    phoneNumber: phoneAndEmail.0,
                    email: phoneAndEmail.1
                )
            )
        }
        
        return personList
    }
}
