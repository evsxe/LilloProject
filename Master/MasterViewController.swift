//
//  MasterViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 20.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

import UIKit

class MasterTableView: UIViewController {
    
    let salonId:Int
    
    init(salonId:Int) {
        self.salonId = salonId
        exampleFillinForMaster()
        mastersArray = mastersArray.filter{$0.salonId == salonId}
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchTextField:UISearchTextField = {
        let srch = UISearchTextField()
        srch.placeholder = "Поиск"
        srch.translatesAutoresizingMaskIntoConstraints = false
        return srch
    }()

    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.userInterfaceStyle == .light{
            self.view.backgroundColor = .white
        }else if traitCollection.userInterfaceStyle == .dark{
            self.view.backgroundColor = .black
        }
        title = "Мастера"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(searchTextField)
        view.addSubview(tableView)
        configTableView()
    }
   
    
    //CONFIGURE TABLEVIEW
    func configTableView (){
        tableView.rowHeight = 100
        tableView.register(MasterCell.self, forCellReuseIdentifier: "MasterCell")
            
        searchTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
}

//EXTANCION TABLEVIEW
extension MasterTableView: UITableViewDelegate, UITableViewDataSource {
    
    
    //NUMBER OF CELLS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mastersArray.count
    }
    
    //WHAT CELLS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let box = tableView.dequeueReusableCell(withIdentifier: "MasterCell") as! MasterCell
        let item = mastersArray[indexPath.row]
        box.set(ofl: item)
        return box
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aboutMaterVC = AboutMasterViewController()
        self.navigationController?.pushViewController(aboutMaterVC, animated: true)
    }
}


