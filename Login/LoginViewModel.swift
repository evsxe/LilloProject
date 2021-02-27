//
//  LoginViewModel.swift
//  Lillo
//
//  Created by Евгений Салуев on 30.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//
import Firebase
import UIKit

func signin(email:String, password:String){
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if let error = error {
            print(error.localizedDescription)
            return
        }else{
            print("logged in")
        }
    }
}
