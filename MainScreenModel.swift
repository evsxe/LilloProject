//
//  MainScreenModel.swift
//  Lillo
//
//  Created by Евгений Салуев on 13.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import Foundation
import UIKit

struct Adress{
    let city:String
    let street:String
    let home:Int
    let korpus:Int?
    let appartments: Int?
    
    init(city:String, street:String, home:Int, korpus:Int?, appartments:Int?) {
        self.city = city
        self.street = street
        self.home = home
        self.korpus = korpus
        self.appartments = appartments
    }
    
    init(city:String, street:String, home:Int, korpus:Int?) {
        self.city = city
        self.street = street
        self.home = home
        self.korpus = korpus
        self.appartments = nil
    }
    
    init(city:String, street:String, home:Int) {
        self.city = city
        self.street = street
        self.home = home
        self.korpus = nil
        self.appartments = nil
    }
    
    func getAdress() ->String{
        var adress = street + " " + String(home)
        guard let korpus = korpus else {return adress}
        adress = adress + " " + String(korpus)
        guard let appartments = appartments else {return adress}
        adress = adress + " " + String(appartments)
        return adress
    }
}

enum CategoryTypes{
    case manicureAndPedicure, haircut, epilation, shugaring, eyelash, all, laser, eyebrows, kosmetology, permanentMakeUp, SPA, makeUp
}

struct Services{
    var name:String
    var photo:UIImage?
    var type:CategoryTypes
    
    init(name:String, photo:UIImage?, type:CategoryTypes) {
        self.photo = photo
        self.name = name
        self.type = type
    }
}

struct Girls {
    var img: UIImage
    var title: String
    var rating: String
    var starimg: UIImage
}


struct Master{
    let firstName:String
    let secondName:String
    let middleName:String?
    let photo:UIImage?
    let rating:Int
    let type:CategoryTypes
    let salonId:Int
    
    init(firstName:String, secondName:String, middleName:String?, type:CategoryTypes, salonId:Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.middleName = middleName
        self.type = type
        self.rating = 0
        self.photo = UIImage(named: "MasterDefault")
        self.salonId = salonId
    }
    
    func getFullName() ->String {
        guard let middleName = middleName else {return firstName + " " + secondName}
        return firstName + " " + middleName + " " + secondName
    }
}


struct Salon{
    let organisationName:String
    let adress:Adress
    let type:CategoryTypes
    let photo:UIImage?
    let rating:Int
    let id:Int
    
    init(organisationName:String, adress:Adress, type:CategoryTypes, id:Int) {
        self.organisationName = organisationName
        self.adress = adress
        self.type = type
        self.rating = 0
        self.id = id
        self.photo = UIImage(named: "SalonDefault")
    }
}


