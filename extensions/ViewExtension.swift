//
//  ViewExtension.swift
//  Lillo
//
//  Created by Евгений Салуев on 24.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func dismissKey(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        self.endEditing(true)
    }
}
