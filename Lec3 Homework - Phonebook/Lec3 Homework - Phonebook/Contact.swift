//
//  Contact.swift
//  Lec3 Homework - Phonebook
//
//  Created by Daniel Butrashvili on 24/10/2018.
//  Copyright © 2018 Daniel Butrashvili. All rights reserved.
//

import Foundation
struct Contact : CustomStringConvertible{
    var description: String{
        return "{Contact: name: \(name), email: \(email), number: \(number), phone type: \(phoneType)}"
    }
    
    var name : String = ""
    var email : String = ""
    var number : String = ""
    var phoneType : PhoneType = PhoneType.SmartPhone
    
    var possibleNames = ["Bob","Sam","Imogen","Piper"]
    var possibleEmails = ["testing@gmail.com","123@walla.co.il","top@top.uk","outlet@ty.io"]
    var possibleNumbers = ["050-1112222","054-2234536","057-2346143","052-1245643"]
    
    
    
    init(name : String,email : String,number : String,phoneType : PhoneType){
        self.name = name
        self.email = email
        self.number = number
        self.phoneType = phoneType
    }
    
    init(){
        self.name = possibleNames[rand(upperBound: possibleNames.count)]
        self.email = possibleEmails[rand(upperBound: possibleEmails.count)]
        self.number = possibleNumbers[rand(upperBound: possibleNumbers.count)]
        self.phoneType = PhoneType(rawValue: rand(upperBound: PhoneType.count.rawValue)) ?? .SmartPhone
    }
    
    func rand(upperBound : Int) -> Int{
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
    
}
