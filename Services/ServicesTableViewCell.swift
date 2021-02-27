//
//  ServicesTableViewCell.swift
//  Lillo
//
//  Created by Евгений Салуев on 15.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit



class ServicesTableViewCell: UITableViewCell {
    
    let profileImage:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let serviceName:UILabel = {
        let txt = UILabel()
        txt.textAlignment = .center
        txt.textColor = UIColor(displayP3Red: 45/255, green: 82/255, blue: 124/255, alpha: 1)
        txt.font = UIFont(name: "OpenSans-SemiBold", size: 30)
        txt.adjustsFontSizeToFitWidth = true
        txt.numberOfLines = 0
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let whiteView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 243/255, green: 246/255, blue: 255/255, alpha: 0.4)
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [profileImage, whiteView].forEach{self.contentView.addSubview($0)}
        whiteView.addSubview(serviceName)
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
    }
    
    func setConstraint(){
        profileImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        profileImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        profileImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        whiteView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        serviceName.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        serviceName.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        serviceName.heightAnchor.constraint(equalTo: whiteView.heightAnchor).isActive = true
        serviceName.widthAnchor.constraint(equalTo: whiteView.widthAnchor).isActive = true
    }
}
