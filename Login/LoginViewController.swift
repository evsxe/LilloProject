//
//  LoginViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 09.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit
import Firebase
import SwiftPhoneNumberFormatter

class LoginViewController: KeyboardViewController {
    
    let errorlabelForPassword:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.isHidden = true
        return lbl
    }()
    
    let errorLabelForPhoneNumber:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.adjustsFontSizeToFitWidth = true
        lbl.isHidden = true
        return lbl
    }()

  let emailTextField:UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Email")
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.keyboardType = .emailAddress
        return txt
    }()

    var passwordTextField:UITextField = {
       let pswd = UITextField()
        pswd.borderStyle = .none
        pswd.setPlaceholderFont(color: Colors.placeholderColor, text: "Пароль")
        pswd.isSecureTextEntry = true
        pswd.translatesAutoresizingMaskIntoConstraints = false

        pswd.setBottomBorder(color: Colors.bottomBorderColor)
        return pswd
    }()

    let loginButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Вход", for: .normal)
        btn.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = Colors.backColor
//        view.dismissKey()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordTextField.addTarget(self, action: #selector(phoneTextFieldIsEditing(textField:)), for: .editingChanged)
        
        let txtFields = [emailTextField, passwordTextField]
        UITextField.connectAllTxtFieldFields(txtfields: txtFields)
        
        txtFields.forEach{$0.addDoneButtonOnKeyboard()}
        
        [errorlabelForPassword, errorLabelForPhoneNumber, emailTextField, passwordTextField, loginButton].forEach{self.view.addSubview($0)}
        setScrollViewElemConstraint()
        registerForKeyboardNotification()
    }
    
    
    override func viewDidLayoutSubviews() {
        loginButton.setGradientBackground(colorTop: Colors.firstColorForGradient, colorBottom: Colors.secondColorForGradient)
    }

    func setScrollViewElemConstraint(){
        
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        errorlabelForPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        errorlabelForPassword.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        errorlabelForPassword.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        errorlabelForPassword.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: errorLabelForPhoneNumber.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        errorLabelForPhoneNumber.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        errorLabelForPhoneNumber.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        errorLabelForPhoneNumber.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        errorLabelForPhoneNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true

        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 62).isActive = true
    }
    
    override func kbWillShow(notification: Notification, button: UIButton) {
        super.kbWillShow(notification: notification, button: loginButton)
        let userInfo = notification.userInfo
        let kbFrameHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if (UIScreen.main.bounds.size.height == 667){
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(6.0), options: UIView.AnimationOptions.allowUserInteraction, animations: {
                button.transform = CGAffineTransform(scaleX: 0.5, y: 0.9).concatenating(CGAffineTransform(translationX: 100, y: -kbFrameHeight.height + 60))
            })
        }else{
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.80), initialSpringVelocity: CGFloat(0.0), options: UIView.AnimationOptions.allowUserInteraction, animations: {
                button.transform = CGAffineTransform(scaleX: 0.5, y: 0.9).concatenating(CGAffineTransform(translationX: 100, y: -kbFrameHeight.height + 85))
            })
        }
        
    }
    
    override func kbWillHide() {
        super.kbWillHide()
        UIView.animate(withDuration: 1) {
            self.loginButton.transform = CGAffineTransform.identity
        }
    }

    @objc
    func phoneTextFieldIsEditing(textField:UITextField){
        if textField.text!.count < 6{
            textField.setBottomBorder(color: .red)
            errorlabelForPassword.isHidden = false
            errorlabelForPassword.text = "Пароль должен быть не менее 6 символов"
        }else{
            textField.setBottomBorder(color: Colors.bottomBorderColor)
            errorlabelForPassword.isHidden = true
        }
    }
    
    
    @objc
    func loginButtonTapped(){
        
        guard let email = emailTextField.text else {return}
        
        if !email.hasValidEmail() {
            emailTextField.shake()
            emailTextField.setBottomBorder(color: .red)
            errorLabelForPhoneNumber.isHidden = false
            errorLabelForPhoneNumber.text = "Пожалуйста, введите корректный Email"
        }else{
            emailTextField.setBottomBorder(color: Colors.bottomBorderColor)
            errorLabelForPhoneNumber.isHidden = true
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            passwordTextField.setBottomBorder(color: .red)
            passwordTextField.shake()
            return
        }
        
        
        
        
        if email.count > 0 && password.count > 0 {
            signin(email: email, password: password)
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            navigationController?.popToRootViewController(animated: false)
            tabBarController?.selectedIndex = 3
        }
    }
}
