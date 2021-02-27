//
//  PersonModel.swift
//  Lillo
//
//  Created by Евгений Салуев on 29.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import Foundation


enum Sex{
    case male, female, unisex
}

class Person{
    let firstName:String
    let secondName:String
    let telephoneNumber:String
    let email:String
    let password:String
    let confirmPassword:String
    let sex:Sex

    init(firstName:String, secondName:String, telephoneNumber:String, email:String, password:String, confirmPassword:String, sex:Sex) {
        self.firstName = firstName
        self.secondName = secondName
        self.telephoneNumber = telephoneNumber
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.sex = sex
        
    }
    
    func checkPasswords() -> Bool {
        return password == confirmPassword
    }
    
    func parseEmail() -> Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    

}
