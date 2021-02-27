//
//  MainScreenViewModel.swift
//  Lillo
//
//  Created by Евгений Салуев on 13.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import Foundation
import UIKit

//MARK: TEST ARRAYS
var salonsArray:[Salon] = []
var mastersArray:[Master] = []
let servicesArray:[Services] = [
    Services(name: "Маникюр и педикюр", photo: UIImage(named: "manicureAndPedicure"), type: .manicureAndPedicure),
    Services(name: "Брови", photo: UIImage(named: "eyebrows"), type: .eyebrows),
    Services(name: "Ресницы", photo: UIImage(named: "eyelash"), type: .eyelash),
    Services(name: "Волосы", photo: UIImage(named: "hair"), type: .haircut),
    Services(name: "Косметология", photo: UIImage(named: "kosmetology"), type: .kosmetology),
    Services(name: "Перманентный макияж губ", photo: UIImage(named: "PermanentMakeup"), type: .permanentMakeUp),
    Services(name: "СПА", photo: UIImage(named: "SPA"), type: .SPA),
    Services(name: "Эпиляция" , photo: UIImage(named: "epulation"), type: .epilation),
    Services(name: "Макияж", photo: UIImage(named: "makeUp"), type: .makeUp),
]

//MARK: TEST FUNCTIONS
func exampleFilling(){
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Пушкинская", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .all, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Лубянка", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .manicureAndPedicure, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Арбат", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .epilation, id: i)
        salonsArray.append(salon)
     }
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Манежная", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .eyebrows, id: i)
        salonsArray.append(salon)
     }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Ресницы", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .eyelash, id: i)
        salonsArray.append(salon)
     }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Парикмахерская", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .haircut, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Косметология", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .kosmetology, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Лазер", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .laser, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
        let adress = Adress(city: "Москва", street: "Макияж", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .makeUp, id: i)
        salonsArray.append(salon)
    }
    
    for i in 1...50{
          let adress = Adress(city: "Москва", street: "Перманентный Макияж", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .permanentMakeUp, id: i)
          salonsArray.append(salon)
      }
    
    for i in 1...50{
          let adress = Adress(city: "Москва", street: "Шугаринг", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .shugaring, id: i)
          salonsArray.append(salon)
      }
    
    for i in 1...50{
          let adress = Adress(city: "Москва", street: "СПА", home: i)
        let salon = Salon(organisationName: "Салон \(i)", adress: adress, type: .SPA, id: i)
          salonsArray.append(salon)
      }
}
func exampleFillinForMaster(){
    for i in 1...10{
        let master = Master(firstName: "Master\(i)", secondName: "Second Name \(i)", middleName: nil, type: .epilation, salonId: i)
        mastersArray.append(master)
    }
    for i in 10...20{
        let master = Master(firstName: "Master\(i)", secondName: "Second Name \(i)", middleName: nil, type: .eyebrows, salonId: i)
        mastersArray.append(master)
    }
    for i in 20...30{
        let master = Master(firstName: "Master\(i)", secondName: "Second Name \(i)", middleName: nil, type: .eyelash, salonId: i)
        mastersArray.append(master)
    }
    for i in 30...40{
        let master = Master(firstName: "Master\(i)", secondName: "Second Name \(i)", middleName: nil, type: .haircut, salonId: i)
        mastersArray.append(master)
    }
    for i in 40...50{
        let master = Master(firstName: "Master\(i)", secondName: "Second Name \(i)", middleName: nil, type: .kosmetology, salonId: i)
        mastersArray.append(master)
    }
}

