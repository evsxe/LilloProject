//
//  SalonsTableViewCell.swift
//  Lillo
//
//  Created by Евгений Салуев on 15.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class SalonsTableViewCell: UITableViewCell {

    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = Colors.SalonsViewBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()

    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "OpenSans-SemiBold", size: 22)
        lbl.textColor = Colors.textColor
        return lbl
    }()
    
    let adressPoint:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "adressPoint")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let adressLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "OpenSans-Regular", size: 17)
        lbl.textColor = Colors.textColor
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let ratingLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "OpenSans-SemiBold", size: 22)
        lbl.textColor = Colors.textColor
        return lbl
    }()

    let starImageView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Star")
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [photoImageView, bottomView].forEach{self.contentView.addSubview($0)}
        [nameLabel, adressPoint, adressLabel, ratingLabel, starImageView].forEach{self.bottomView.addSubview($0)}
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        bottomView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -10).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bottomView.leftAnchor.constraint(equalTo: photoImageView.leftAnchor, constant: 10).isActive = true
        bottomView.rightAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: -10).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        adressPoint.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        adressPoint.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        adressPoint.heightAnchor.constraint(equalToConstant: 20).isActive = true
        adressPoint.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: adressPoint.topAnchor).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: adressPoint.rightAnchor, constant: 5).isActive = true
        adressLabel.bottomAnchor.constraint(equalTo: adressPoint.bottomAnchor).isActive = true
        adressLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        starImageView.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        starImageView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -50).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        ratingLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: starImageView.leftAnchor, constant: -3).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        ratingLabel.bottomAnchor.constraint(equalTo: starImageView.bottomAnchor).isActive = true
    }
}
