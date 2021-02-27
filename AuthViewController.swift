//
//  AuthViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 07.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    let loginButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Вход", for: .normal)
        btn.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 20)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    let registrationButton:UIButton = {
        let btn = UIButton(type: .system)
//        btn.setTitle("Регистрация", for: .normal)
        btn.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        btn.titleLabel?.textColor = Colors.textColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        return btn
    }()
    
    let discription:UILabel = {
        let txt = UILabel()
        txt.text = "Добро\nпожаловать\nв Lillo"
        txt.font = txt.font.withSize(50)
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        self.view.backgroundColor = Colors.backColor
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
        [loginButton, registrationButton, discription].forEach{ self.view.addSubview($0)}
      
      setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        registrationButton.setGradientBorder(title: "Регистрация", startColor: Colors.firstColorForGradient, endColor: Colors.secondColorForGradient)
        loginButton.setGradientBackground(colorTop: Colors.firstColorForGradient, colorBottom: Colors.secondColorForGradient)
    }
    
    func setConstraints(){
        discription.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        discription.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        discription.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        discription.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: self.view.frame.height * 0.1).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        registrationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 62).isActive = true
        registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    @objc
    func didTapLoginButton(){
        let loginVC:UIViewController = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc
    private func didTapRegistrationButton(){
//        let registrationVC = RegistrationPageViewController()
        let registrationVC = FirstScreenViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}



