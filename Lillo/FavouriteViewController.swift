//
//  FavouriteViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 24.05.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class FavouriteViewController : UIViewController {
    
    var date:[String] = []
    
    init(date:[String]) {
        self.date = date
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bckGround = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
    
    let titleLabel:UILabel = {
        let txt = UILabel()
        txt.text = "Выберите время"
        txt.textColor = UIColor(displayP3Red: 45/255, green: 82/255, blue: 124/255, alpha: 1)
        txt.font = UIFont(name: "OpenSans-SemiBold", size: 35)
        txt.numberOfLines = 0
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let loginButton:UIButton = {
         let btn = UIButton()
         btn.backgroundColor = UIColor(displayP3Red: 45/265, green: 0, blue: 1, alpha: 1)
         btn.setTitle("Далее", for: .normal)
         btn.titleLabel?.font = btn.titleLabel?.font.withSize(25)
         btn.tintColor = .white
         btn.clipsToBounds = true
         btn.translatesAutoresizingMaskIntoConstraints = false
         return btn
     }()
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 143, height: 60)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .none
        cv.contentInset = UIEdgeInsets(top: 310,left: 10,bottom: 10, right: 10)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.view.backgroundColor = bckGround
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(loginButton)
        setConstraint()
    }
    
    func setConstraint(){
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 80).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension FavouriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8 // How many cells to display
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        let cellLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        cellLabel.textColor = .white
        cell.contentView.addSubview(cellLabel)
        //cellLabel.text = "Row: \(indexPath.row)"
        cell.backgroundColor = UIColor.blue
        return cell
    }
}
extension FavouriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
    
}
