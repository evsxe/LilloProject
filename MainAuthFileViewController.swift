//
//  MainAuthFileViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 27.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class MainAuthFileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backColor

        
        if isUserLoggedIn(){
            navigationController?.viewControllers = [FirstScreenViewController()]
        }else{
            navigationController?.viewControllers = [AuthViewController()]
        }
    }
    
    fileprivate func isUserLoggedIn()->Bool{
        return UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }

}


