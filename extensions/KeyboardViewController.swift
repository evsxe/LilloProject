//
//  keyboardViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 27.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func kbWillShow(notification:Notification, button:UIButton){
        
        
    }
    
    @objc
    func kbWillHide(){}

}
