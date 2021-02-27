//
//  MainScreenNavigationController.swift
//  Lillo
//
//  Created by Евгений Салуев on 06.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    let search:UISearchTextField = {
        let srch = UISearchTextField()
        srch.translatesAutoresizingMaskIntoConstraints = false
        return srch
    }()
    
    let tableView:UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.separatorStyle = .none
        return tbl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Услуги"
        search.backgroundColor = Colors.backColor
        self.view.backgroundColor = Colors.backColor
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ServicesTableViewCell.self, forCellReuseIdentifier: "ServicesCell")
        
        [search, tableView].forEach{self.view.addSubview($0)}
        setConstraint()
    }
    
    func setConstraint(){
        
        search.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        search.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        search.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        tableView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
}

extension MainScreenViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let currenImage = servicesArray[indexPath.section].photo else {return 500}
        let imgCrop = currenImage.getRation()
        return tableView.frame.width / imgCrop
    }
 }

extension MainScreenViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesCell", for: indexPath) as? ServicesTableViewCell else {
            assertionFailure("ServicesCell is not available")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.profileImage.image = servicesArray[indexPath.row].photo
        cell.serviceName.text = servicesArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(1)
        let salonVC = SalonsViewController(type: servicesArray[indexPath.section].type)
        navigationController?.pushViewController(salonVC, animated: true)
    }


 }

extension UIImage{
    func getRation()->CGFloat{
        let widthRation = CGFloat(self.size.width / self.size.height)
        return widthRation
    }
}

