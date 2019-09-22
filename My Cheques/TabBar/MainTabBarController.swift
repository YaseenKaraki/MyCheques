//
//  MainTabBarController.swift
//  My Cheques
//
//  Created by Apple on 8/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

 class MainTabBarController : UITabBarController{

    override func viewDidLoad() {

        super.viewDidLoad()
        tabBar.barTintColor = .white
        view.backgroundColor = THEME
        self.hideKeyboardWhenTappedAround() // tap to  hide keyboard..
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false

        setupTabBar()
        configrationNavigationBar()
    }
  
   public func setupTabBar(){
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: YClolr], for: .selected) // for text color
        UITabBar.appearance().tintColor = YClolr// for icon color

        
        let clanderController = UINavigationController(rootViewController: CalenderViewController())
        clanderController.tabBarItem.image = UIImage(named: "iconCalenderWhite")
        clanderController.tabBarItem.selectedImage = UIImage(named: "iconCalenderDark")?.withRenderingMode(.alwaysTemplate)
        clanderController.title = "Calender"
        clanderController.navigationController?.title = "Calender"
    
        
        
        
        let chequesBookController  = UINavigationController(rootViewController: ChequesBooksViewController())
        chequesBookController.tabBarItem.image = UIImage(named: "iconCheckbookWhite")
        chequesBookController.tabBarItem.selectedImage = UIImage(named: "iconCheckbookDark")?.withRenderingMode(.alwaysTemplate)
//        chequesBookController.tabBarItem.selectedImage.appearance().setTitleTextAttributes([tabBarItem.selectedImage : YClolr], for: .selected)

        
        chequesBookController.title = "Cheques Books"
        
        let receivedChequesController = UINavigationController(rootViewController: ReceivedChequesViewController())
        receivedChequesController.tabBarItem.image = UIImage(named: "iconReceivedChequesWhite")
        receivedChequesController.tabBarItem.selectedImage = UIImage(named: "iconReceivedChequesDark")?.withRenderingMode(.alwaysTemplate)
        receivedChequesController.title = "Received Cheques"
        
        
        viewControllers = [clanderController, chequesBookController, receivedChequesController]
        
        
    }
    public func configrationNavigationBar (){
        
        navigationController?.navigationBar.barTintColor = YClolr
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
//        let menuButton = UIButton(type: .system)
//        menuButton.setImage( #imageLiteral(resourceName: "iconMenu") ,for: .normal)
//        
//        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
//            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        
    }
    @objc func handleMenuToggle(){
        print("From Main")

   
    }
    let notificationsItem = NotificationsItem()
    let settingItem = SettingItem()
    let logoutItem = LogoutItem()
    
    func showSettings(setting: Setting){

        navigationController?.pushViewController(settingItem, animated: true)
        settingItem.navigationItem.title = setting.name
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
