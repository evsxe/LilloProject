//
//  MasterTableViewCell.swift
//  Lillo
//
//  Created by Евгений Салуев on 20.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit


class MasterCell: UITableViewCell {
    
    var Image = UIImageView()
    var TitleLabel = UILabel()
    var RateLabel = UILabel()
    var Star = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(Image)
        addSubview(TitleLabel)
        addSubview(RateLabel)
        addSubview(Star)
        
        configImage()
        configTitleLabel()
        ImageConstrains()
        TitleLabelConstraints()
        RateLabelConstraints()
        StarConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has bot been inplemented")
    }
    

    func set (ofl: Master) {
        Image.image = ofl.photo
        TitleLabel.text = ofl.getFullName()
        RateLabel.text = String(ofl.rating)
        Star.image = UIImage(named: "Star 1")
    }
    
    
    //IMAGE AND TITEL LABEL SETTINGS
    func configImage() {
        Image.contentMode = .scaleAspectFill
        Image.layer.cornerRadius = 10
        Image.clipsToBounds = true
        
    }
    
    func configTitleLabel() {
        TitleLabel.numberOfLines = 0
        TitleLabel.adjustsFontSizeToFitWidth = true
        TitleLabel.font = UIFont(name: "Arial", size: 22)
    }
    
    //IMAGE,TITEL LABEL AND RATE CONSTRAINS
    func ImageConstrains() {
        Image.translatesAutoresizingMaskIntoConstraints = false
        Image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        Image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        Image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        Image.widthAnchor.constraint(equalTo: Image.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func TitleLabelConstraints(){
        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        TitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        TitleLabel.leadingAnchor.constraint(equalTo: Image.trailingAnchor, constant: 80).isActive = true
        TitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        TitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func RateLabelConstraints(){
        RateLabel.translatesAutoresizingMaskIntoConstraints = false
        RateLabel.leadingAnchor.constraint(equalTo: Image.trailingAnchor, constant: 80).isActive = true
        RateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        RateLabel.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 5).isActive = true
        RateLabel.centerYAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: -15).isActive = true
    }
    
    func StarConstrains(){
        Star.translatesAutoresizingMaskIntoConstraints = false
        Star.leadingAnchor.constraint(equalTo: Image.trailingAnchor, constant: 105).isActive = true
        Star.heightAnchor.constraint(equalToConstant: 18).isActive = true
        Star.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 5).isActive = true
        Star.centerYAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: -15).isActive = true
        Star.rightAnchor.constraint(equalTo: rightAnchor, constant: -135).isActive = true
    }
    
}
