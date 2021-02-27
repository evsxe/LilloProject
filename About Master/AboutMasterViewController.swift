//
//  AboutMasterViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 03.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class AboutMasterViewController: UIViewController {
    
    let myScrollView = UIScrollView()
    
    var girlName = UILabel()
    var girlAddress = UILabel()
    let girlImageView: UIImageView = {
        let Image = UIImageView()
        Image.image = UIImage(named: "Anna")
        return Image
    }()
    
    var myBtnReviews = UIButton()
    var myBtnSignUp = UIButton()
    var numRate = UILabel()
    let numStar: UIImageView = {
        let Zvezda = UIImageView()
        Zvezda.image = UIImage(named: "star3")
        return Zvezda
    }()
    
    let locImage: UIImageView = {
        let loc = UIImageView()
        loc.image = UIImage(named: "locImg")
        return loc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
            
            //SCROLL VIEW
        self.view.addSubview(self.myScrollView)
        self.myScrollView.translatesAutoresizingMaskIntoConstraints = false
            
        self.myScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        self.myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        self.myScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        self.myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
            
        //GIRL IMAGE
        self.myScrollView.addSubview(girlImageView)
        girlImageView.translatesAutoresizingMaskIntoConstraints = false
        girlImageView.leadingAnchor.constraint(equalTo: self.myScrollView.leadingAnchor).isActive = true
        girlImageView.topAnchor.constraint(equalTo: self.myScrollView.topAnchor).isActive = true
        girlImageView.trailingAnchor.constraint(equalTo: self.myScrollView.trailingAnchor).isActive = true
        girlImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        girlImageView.widthAnchor.constraint(equalTo: self.myScrollView.widthAnchor).isActive = true
        
            //GIRL NAME
        self.myScrollView.addSubview(girlName)
            
        girlName.backgroundColor = .white
        girlName.text = "Алиса"
        girlName.font = UIFont(name: "Arial-BoldMT", size: 40)
        girlName.textAlignment = .left
        
        girlName.translatesAutoresizingMaskIntoConstraints = false
        girlName.leadingAnchor.constraint(equalTo: self.myScrollView.leadingAnchor, constant: 15).isActive = true
        girlName.topAnchor.constraint(equalTo: self.girlImageView.bottomAnchor, constant: 20).isActive = true
        girlName.trailingAnchor.constraint(equalTo: self.myScrollView.trailingAnchor, constant: -275).isActive = true
        girlName.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            //GIRL ADDRESS
        self.myScrollView.addSubview(girlAddress)
            
        girlAddress.backgroundColor = .white
        girlAddress.text = "Ленинградский проспект 39, стр. 79"
        girlAddress.font = UIFont(name: "Arial", size: 18)
        girlAddress.textAlignment = .left
            
        girlAddress.translatesAutoresizingMaskIntoConstraints = false
        girlAddress.leadingAnchor.constraint(equalTo: self.myScrollView.leadingAnchor, constant: 35).isActive = true
        girlAddress.topAnchor.constraint(equalTo: self.girlName.bottomAnchor, constant: 20).isActive = true
        girlAddress.trailingAnchor.constraint(equalTo: self.myScrollView.trailingAnchor, constant: -30).isActive = true
        girlAddress.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            // REVIEWS BUTTON
        self.myScrollView.addSubview(myBtnReviews)
        myBtnReviews.setTitleColor(.white, for: .normal)
        myBtnReviews.setTitle("Отзывы", for: .normal)
            
        myBtnReviews.backgroundColor = UIColor.blue
        myBtnReviews.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 25)
        myBtnReviews.layer.cornerRadius = 25
        myBtnReviews.clipsToBounds = true
        myBtnReviews.layer.borderWidth = 3
        myBtnReviews.layer.borderColor = UIColor.darkGray.cgColor
            
        myBtnReviews.translatesAutoresizingMaskIntoConstraints = false
        myBtnReviews.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
        myBtnReviews.topAnchor.constraint(equalTo: self.girlAddress.bottomAnchor, constant: 400).isActive = true
        myBtnReviews.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myBtnReviews.widthAnchor.constraint(equalToConstant: 380).isActive = true
            
            // SIGN UP BUTTON
        self.myScrollView.addSubview(myBtnSignUp)
        myBtnSignUp.setTitleColor(.white, for: .normal)
        myBtnSignUp.setTitle("Записаться", for: .normal)
            
        myBtnSignUp.backgroundColor = UIColor.blue
        myBtnSignUp.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 25)
        myBtnSignUp.layer.cornerRadius = 25
        myBtnSignUp.clipsToBounds = true
        myBtnSignUp.layer.borderWidth = 3
        myBtnSignUp.layer.borderColor = UIColor.darkGray.cgColor
        
        myBtnSignUp.translatesAutoresizingMaskIntoConstraints = false
        myBtnSignUp.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive = true
        myBtnSignUp.topAnchor.constraint(equalTo: self.myBtnReviews.bottomAnchor, constant: 20).isActive = true
        myBtnSignUp.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myBtnSignUp.widthAnchor.constraint(equalToConstant: 380).isActive = true
            
            //GIRL NUM RATE
        self.myScrollView.addSubview(numRate)
            
        numRate.backgroundColor = .white
        numRate.text = "5"
        numRate.font = UIFont(name: "Arial-BoldMT", size: 40)
        numRate.textAlignment = .left
            
        numRate.translatesAutoresizingMaskIntoConstraints = false
        numRate.leadingAnchor.constraint(equalTo: self.girlName.trailingAnchor, constant: 10).isActive = true
        numRate.topAnchor.constraint(equalTo: self.girlImageView.bottomAnchor, constant: 20).isActive = true
        numRate.trailingAnchor.constraint(equalTo: self.myScrollView.trailingAnchor, constant: -240).isActive = true
        numRate.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            //STAR IMAGE
        self.myScrollView.addSubview(numStar)
        numStar.translatesAutoresizingMaskIntoConstraints = false
        numStar.leadingAnchor.constraint(equalTo: self.numRate.trailingAnchor, constant: 1).isActive = true
        numStar.topAnchor.constraint(equalTo: self.girlImageView.bottomAnchor, constant: 25).isActive = true
        numStar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        numStar.widthAnchor.constraint(equalToConstant: 50).isActive = true
            
            //LOCATION IMAGE
        self.myScrollView.addSubview(locImage)
        locImage.translatesAutoresizingMaskIntoConstraints = false
        locImage.topAnchor.constraint(equalTo: self.girlName.bottomAnchor, constant: 31).isActive = true
        locImage.leadingAnchor.constraint(equalTo: self.myScrollView.leadingAnchor, constant: 14).isActive = true
        locImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        locImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
            
    }

        
    override func viewDidAppear(_ animated: Bool) {
        myScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 200)
            
    }
        
}
