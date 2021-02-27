//
//  RegistrationViewModel.swift
//  Lillo
//
//  Created by Евгений Салуев on 29.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import Foundation
import Firebase
import UIKit

func createUser(firstName:String, secondName:String, email:String, password:String, VC:UIViewController) -> Bool{
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error{
            print(1)
            print(error.localizedDescription)
            return
        }
        guard let uid = result?.user.uid else {
            print("uid error")
            return
        }
        let values = ["firstName": firstName, "secondName": secondName, "Email":email]
        Database.database().reference().child(uid).updateChildValues(values) { (error, ref) in
            if let error = error{
                print("Failed to update data", error.localizedDescription)
                return
            }
        }
    }
    return true
}
