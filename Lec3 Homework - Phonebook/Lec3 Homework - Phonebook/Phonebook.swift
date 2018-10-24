//
//  Phonebook.swift
//  Lec3 Homework - Phonebook
//
//  Created by Daniel Butrashvili on 24/10/2018.
//  Copyright © 2018 Daniel Butrashvili. All rights reserved.
//

import Foundation
struct Phonebook : CustomStringConvertible{
    var description: String{
        var str : String = ""
        for c in contacts{
            str += "\(c)\n"
        }
        return str
    }
    var contacts : [Contact]
    
    mutating func appendContact(newcontact : Contact) -> Bool{
        contacts.append(newcontact)
        return true
    }
    
    mutating func removeContact(index : Int) -> Contact?{
        var removedContact : Contact? = nil
        if index < contacts.count{
            removedContact = contacts.remove(at: index)
        }
        return removedContact
    }
    
    mutating func updateContact(index : Int,newContact : Contact) -> Bool{
        if index < contacts.count{
        contacts[index] = newContact
            return true
        }
        return false
    }
    
    func getContact(index : Int) -> Contact?{
        if index < contacts.count{
            return contacts[index]
        }
        else{
            return nil
        }
    }
    
}
