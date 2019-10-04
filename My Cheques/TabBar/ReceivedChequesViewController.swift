//
//  ReceivedChequesViewController.swift
//  My Cheques
//
//  Created by Apple on 8/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ReceivedChequesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME
        configrationNavigationBar()
        //        navigationItem.title = "Received Cheques"
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
    }
    func configrationNavigationBar (){
        navigationController?.navigationBar.barTintColor = YClolr
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = THEME
        
    }
    
    
    
    
    
    lazy var settingLauncher: SettingsLauncher = {
        let s = SettingsLauncher()
        s.receivedChequesController = self
        return s
        
        
    }()
    
    @objc func handleMenuToggle(){
        print("HandleCalender from ReceivedCheques")
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
