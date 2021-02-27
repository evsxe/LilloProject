//
//  SecondScreenViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 24.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    var firstScreenInfo:[String:String] = [:]
    
    init(firstName:String, secondName:String, email:String){
        firstScreenInfo["FirstName"] = firstName
        firstScreenInfo["SecondName"] = secondName
        firstScreenInfo["Email"] = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let passwordTextField:UITextField = {
       let pswd = UITextField()
        pswd.borderStyle = .none
        pswd.setPlaceholderFont(color: Colors.placeholderColor, text: "Пароль")
        pswd.isSecureTextEntry = true
        pswd.translatesAutoresizingMaskIntoConstraints = false
        pswd.setBottomBorder(color: Colors.bottomBorderColor)
        pswd.addTarget(self, action: #selector(passwordTextFieldIsEditing), for: .editingChanged)
        return pswd
    }()
    
    let passwordTextFieldErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .red
        lbl.isHidden = true
        return lbl
    }()
    
    let confirmPasswordTextField:UITextField = {
       let pswd = UITextField()
        pswd.borderStyle = .none
        pswd.setPlaceholderFont(color: Colors.placeholderColor, text: "Повторите пароль")
        pswd.isSecureTextEntry = true
        pswd.translatesAutoresizingMaskIntoConstraints = false
        pswd.setBottomBorder(color: Colors.bottomBorderColor)
        pswd.addTarget(self, action: #selector(checkPasswords), for: .editingChanged)
        return pswd
    }()
    
    let confirmPasswordErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Пароли не совпадают"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isHidden = true
        lbl.textColor = .red
        return lbl
    }()
    
    let registrationButton:UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.dismissKey()
        self.view.backgroundColor = Colors.backColor
        
        let txt = [passwordTextField, confirmPasswordTextField]
        UITextField.connectAllTxtFieldFields(txtfields: txt)
        txt.forEach{$0.addDoneButtonOnKeyboard()}
        
        [passwordTextField, confirmPasswordTextField, registrationButton, passwordTextFieldErrorLabel, confirmPasswordErrorLabel].forEach{self.view.addSubview($0)}
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        registrationButton.setGradientBorder(title: "Регистрация", startColor: Colors.firstColorForGradient, endColor: Colors.secondColorForGradient)
    }
    
    func setConstraints(){
        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        passwordTextFieldErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextFieldErrorLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        passwordTextFieldErrorLabel.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        passwordTextFieldErrorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextFieldErrorLabel.bottomAnchor, constant: 10).isActive = true
        confirmPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        confirmPasswordErrorLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 5).isActive = true
        confirmPasswordErrorLabel.leftAnchor.constraint(equalTo: confirmPasswordTextField.leftAnchor).isActive = true
        confirmPasswordErrorLabel.rightAnchor.constraint(equalTo: confirmPasswordTextField.rightAnchor).isActive = true
        confirmPasswordErrorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        registrationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
    }
    
    @objc
    func passwordTextFieldIsEditing(){
        if passwordTextField.text!.count < 6{
            passwordTextField.setBottomBorder(color: .red)
            passwordTextFieldErrorLabel.isHidden = false
            passwordTextFieldErrorLabel.text = "Пароль должен быть длиннее 6 символов"
        }else{
            passwordTextField.setBottomBorder(color: Colors.bottomBorderColor)
            passwordTextFieldErrorLabel.isHidden = true
        }
    }
    
    @objc
    func checkPasswords(){
        if passwordTextField.text != confirmPasswordTextField.text{
            confirmPasswordTextField.setBottomBorder(color: .red)
            confirmPasswordErrorLabel.isHidden = false
        }else{
            confirmPasswordErrorLabel.isHidden = true
            confirmPasswordTextField.setBottomBorder(color: Colors.bottomBorderColor)
        }
    }
    
    @objc
    func registrationButtonTapped(){
        
        print("Tapped")
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            passwordTextField.shake()
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword != "", confirmPassword == password else {
            confirmPasswordTextField.shake()
            return
        }
        
        guard let firstName = firstScreenInfo["FirstName"] else {
            return
        }
        guard let secondName = firstScreenInfo["SecondName"] else {return}
        guard let email = firstScreenInfo["Email"] else {return}
        
        if password.count != 0 && confirmPassword.count != 0{
            if !createUser(firstName: firstName, secondName: secondName, email: email, password: password, VC: self){
                tabBarController?.selectedIndex = 3
            }
            navigationController?.popToRootViewController(animated: false)
            tabBarController?.selectedIndex = 0
        }
        
    }
}
