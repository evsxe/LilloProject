//
//  FirstScreenViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 24.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit
import Firebase

class FirstScreenViewController: KeyboardViewController {

    let firstNameTextField:UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Имя")
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.addTarget(self, action: #selector(firstNameTextFieldStartEditing), for: .editingDidBegin)
        return txt
    }()
    
    let firstNameErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.adjustsFontSizeToFitWidth = true
        lbl.isHidden = true
        return lbl
    }()
    
    let secondNameTextField:UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Фамилия")
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.addTarget(self, action: #selector(secondNameStartEditing), for: .editingDidBegin)
        return txt
    }()
    
    let secondNameErrorLabel:UILabel = {
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
    
    let emailTextFieldErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.adjustsFontSizeToFitWidth = true
        lbl.isHidden = true
        lbl.text = "Email уже зарегистрирован"
        return lbl
    }()
    
    let nextButton:UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backColor
        
        [firstNameTextField, firstNameErrorLabel, secondNameTextField, secondNameErrorLabel, emailTextField, nextButton, emailTextFieldErrorLabel].forEach{self.view.addSubview($0)}
        setConstraint()
        let txt = [firstNameTextField, secondNameTextField,emailTextField]
        UITextField.connectAllTxtFieldFields(txtfields: txt)
        self.view.dismissKey()
        
        registerForKeyboardNotification()

    }
    
    override func viewDidLayoutSubviews() {
        nextButton.setGradientBorder(title: "Далее", startColor: Colors.firstColorForGradient, endColor: Colors.secondColorForGradient)
    }
    
    @objc
    func firstNameTextFieldStartEditing(){
        firstNameTextField.setBottomBorder(color: Colors.bottomBorderColor)
        firstNameErrorLabel.isHidden = true
    }
    
    @objc
    func secondNameStartEditing(){
        firstNameErrorLabel.isHidden = true
        firstNameTextField.setBottomBorder(color: Colors.bottomBorderColor)
    }
    
//    override func animate(kbFrameHeight: CGFloat) {
//        super.animate(kbFrameHeight: kbFrameHeight)
//        if (UIScreen.main.bounds.size.height == 667){
//            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(6.0), options: UIView.AnimationOptions.allowUserInteraction, animations: {
//                self.nextButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.9).concatenating(CGAffineTransform(translationX: 100, y: -kbFrameHeight + 60))
//            })
//        }else{
//            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: CGFloat(0.80), initialSpringVelocity: CGFloat(0.0), options: UIView.AnimationOptions.allowUserInteraction, animations: {
//                self.nextButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.9).concatenating(CGAffineTransform(translationX: 100, y: -kbFrameHeight + 85))
//            })
//    }
        
        
//    }
    
    func setConstraint(){
        firstNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        firstNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        firstNameErrorLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 5).isActive = true
        firstNameErrorLabel.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor).isActive = true
        firstNameErrorLabel.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor).isActive = true
        firstNameErrorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        secondNameTextField.topAnchor.constraint(equalTo: firstNameErrorLabel.bottomAnchor, constant: 10).isActive = true
        secondNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        secondNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        secondNameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        secondNameErrorLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 5).isActive = true
        secondNameErrorLabel.leftAnchor.constraint(equalTo: secondNameTextField.leftAnchor).isActive = true
        secondNameErrorLabel.rightAnchor.constraint(equalTo: secondNameTextField.rightAnchor).isActive = true
        secondNameErrorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: secondNameErrorLabel.bottomAnchor, constant: 10).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        emailTextFieldErrorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        emailTextFieldErrorLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        emailTextFieldErrorLabel.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        emailTextFieldErrorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    @objc
    func nextButtonTapped(){
        
//        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
//        UserDefaults.standard.synchronize()
//
//        do {
//            try Auth.auth().signOut()
//            print("Logged out")
//        } catch {
//            print("Error")
//        }
        guard let firstName = firstNameTextField.text, firstName != "" else{
            firstNameTextField.setBottomBorder(color: .red)
            firstNameTextField.shake()
            firstNameErrorLabel.isHidden = false
            firstNameErrorLabel.text = "Введите имя"
            return
        }
        firstNameErrorLabel.isHidden = true

        guard let secondName = secondNameTextField.text, secondName != "" else {
            secondNameTextField.setBottomBorder(color: .red)
            secondNameTextField.shake()
            secondNameErrorLabel.isHidden = false
            secondNameErrorLabel.text = "Введите фамилию"
            return
        }
        secondNameErrorLabel.isHidden = true

        guard let email = emailTextField.text, email != "", emailTextField.text!.hasValidEmail() else {
            emailTextField.setBottomBorder(color: .red)
            emailTextField.shake()
            return
        }

        //MARK: -Нужно переделать
        if email.count != 0 && firstName.count != 0 && secondName.count != 0{
            Auth.auth().signIn(withEmail: email, password: " ") { (user, error) in
                if error != nil {
                    if (error?._code == 17009) {
                        self.emailTextFieldErrorLabel.isHidden = false
                        return
                    } else if(error?._code == 17011) {
                        self.emailTextFieldErrorLabel.isHidden = true
                        let secondVC = SecondScreenViewController(firstName: firstName, secondName: secondName, email: email)
                        self.navigationController?.pushViewController(secondVC, animated: true)
                        return
                    }
                }
            }
        }
     }
}
