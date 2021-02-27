//
//  HistoryViewController.swift
//  Lillo
//
//  Created by Евгений Салуев on 07.04.2020.
//  Copyright © 2020 Евгений Салуев. All rights reserved.
//

import UIKit
import FSCalendar

class HistoryViewController: UIViewController, UIGestureRecognizerDelegate, FSCalendarDelegate,FSCalendarDataSource {
    
    var selectedDate:[String] = []
    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Выберите дату"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = Colors.textColor
        lbl.font = UIFont(name: "OpenSans-SemiBold", size: 35)
        return lbl
    }()
    
    let calendar:FSCalendar = {
        let calendar = FSCalendar()
        calendar.backgroundColor = Colors.backColor
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.locale = NSLocale(localeIdentifier: "Ru") as Locale
        return calendar
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()
    
    let nextButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Далее", for: .normal)
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backColor
        calendar.delegate = self
        calendar.dataSource = self
        [titleLabel ,calendar, nextButton].forEach{self.view.addSubview($0)}
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.setGradientBackground(colorTop: Colors.firstColorForGradient, colorBottom: Colors.secondColorForGradient)
    }
    
    func setConstraints(){
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        calendar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        calendar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        calendar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
    }
    
    

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print("did select date \(self.dateFormatter.string(from: date))")
        nextButton.isHidden = false
        selectedDate = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDate)")
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    @objc
    func nextButtonTapped(){
        let signUPVC = FavouriteViewController(date: selectedDate)
        navigationController?.pushViewController(signUPVC, animated: true)
    }
    
//
//        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
//            print("\(self.dateFormatter.string(from: calendar.currentPage))")
//        }
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 2
//        }
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return [2,20][section]
//        }

}

//extension CalendarViewController:FSCalendarDataSource{}
//extension CalendarViewController:FSCalendarDelegate{}

