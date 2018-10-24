//
//  ViewController.swift
//  Lec3 Homework - Phonebook
//
//  Created by Daniel Butrashvili on 24/10/2018.
//  Copyright © 2018 Daniel Butrashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var phoneBook = Phonebook(contacts: [])
//        phoneBook.contacts.append(Contact(name: "Daniel", email: "test@gmail.com", number: "050-2342343", phoneType: .SmartPhone))
        for _ in 0..<5{
            phoneBook.appendContact(newcontact: Contact())
        }
        
        
        print(phoneBook,terminator:"----------\n")
        phoneBook.removeContact(index: 2)
        print(phoneBook,terminator:"----------\n")
        phoneBook.updateContact(index: 2, newContact: Contact(name: "Me", email: "me@me.me", number: "222-2222111", phoneType: .SmartPhone))
        print(phoneBook,terminator:"----------\n")
        let singleContact = phoneBook.getContact(index: 2)
        
        if let singleContact = singleContact{
            print("Single Contact :\(singleContact)")
        }
        else{
            print("zippite squat")
        }
    }

   


}

