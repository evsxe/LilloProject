//
//  SalonsViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 15.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit


class SalonsViewController: UIViewController {
    
    let type:CategoryTypes
    
    init(type:CategoryTypes) {
        exampleFilling()
        self.type = type
        salonsArray = salonsArray.filter{$0.type == type}
        super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let search:UISearchTextField = {
        let srch = UISearchTextField()
        srch.placeholder = "Поиск"
        srch.translatesAutoresizingMaskIntoConstraints = false
        return srch
    }()
    
    let tableview:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Салоны"
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backNavButton")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backNavButton")
        navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.view.backgroundColor = Colors.backColor
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(SalonsTableViewCell.self, forCellReuseIdentifier: "SalonsCell")
        
        [search, tableview].forEach{self.view.addSubview($0)}
        setConstraints()
    }
    
    private func setConstraints(){
        search.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        search.heightAnchor.constraint(equalToConstant: 40).isActive = true
        search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        search.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        tableview.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 10).isActive = true
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension SalonsViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return salonsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SalonsCell") as? SalonsTableViewCell else {
            assertionFailure("SalonsCell is not available")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.photoImageView.image = UIImage(named: "SalonDefault")
        cell.nameLabel.text = salonsArray[indexPath.row].organisationName
        cell.adressLabel.text = salonsArray[indexPath.row].adress.getAdress()
        cell.ratingLabel.text = String(salonsArray[indexPath.row].rating)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let masterVC = MasterTableView(salonId: salonsArray[indexPath.row].id)
        self.navigationController?.pushViewController(masterVC, animated: true)
    }
}


extension SalonsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
}
