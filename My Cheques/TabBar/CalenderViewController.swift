 //
 //  CalenderViewController.swift
 //  My Cheques
 //
 //  Created by Apple on 8/20/19.
 //  Copyright © 2019 Apple. All rights reserved.
 //
 
 import UIKit
 import FSCalendar
 class CalenderViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    fileprivate weak var calendar: FSCalendar!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = THEME
//        self.title = "Callender"

        configrationNavigationBar()
        let barHeight=self.navigationController?.navigationBar.frame.height ?? 0
        let x = barHeight / 2.0
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
//        calendar.dataSource = self
//        calendar.delegate = self
        view.addSubview(calendar)
        calendar.appearance.headerTitleColor = YClolr
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        calendar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 300).isActive = true
        calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: barHeight - x).isActive = true
        self.calendar = calendar

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false

    }
    

    func configrationNavigationBar (){
//        add logo to navbar
//        let h =  self.navigationController?.navigationBar.frame.size.height
//        let w =  self.navigationController?.navigationBar.frame.size.width
//
//        let logoImage = UIImageView(image: UIImage(named: "appLogo"))
//        logoImage.frame = CGRect(x: 0, y: 0, width: w!/2, height: h!)
//
//
//        logoImage.contentMode = .scaleAspectFit
//       navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoImage)
        
        
        
        navigationController?.navigationBar.barTintColor = YClolr
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = THEME
  
    }
    
  
        
    
        
    lazy var settingLauncher: SettingsLauncher = {
        let s = SettingsLauncher()
        s.calenderController = self
        return s


    }()

    @objc func handleMenuToggle(){
        print("HandleCalender from Calender")
//        show menu
        settingLauncher.handleMenuToggle()
//     showControllerForSettings()


    }
    let notificationsItem = NotificationsItem()
    let settingItem = SettingItem()
    let logoutItem = LogoutItem()

    func showControllerForSetting(setting: Setting){

        let dumyViewController = UIViewController()
        navigationController?.pushViewController(dumyViewController, animated: true)

        dumyViewController.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = THEME
//        dumyViewController.view.backgroundColor = UIColor.black // for title(name) color

    }
    func showSettings(setting: Setting){
        navigationController?.pushViewController(settingItem, animated: true)


        self.settingItem.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = THEME
        //        dumyViewController.view.backgroundColor = UIColor.black // for title(name) color

    }
    func showNotifications(setting: Setting){

        navigationController?.pushViewController(notificationsItem, animated: true)

        notificationsItem.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = THEME
        //        dumyViewController.view.backgroundColor = UIColor.black // for title(name) color

    }
    func showLogout(setting: Setting){
        
        navigationController?.pushViewController(logoutItem, animated: true)

        logoutItem.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = THEME
        //        dumyViewController.view.backgroundColor = UIColor.black // for title(name) color

    }


    }
 extension ViewController: FSCalendarDataSource, FSCalendarDelegate{
    
    
    
 }

