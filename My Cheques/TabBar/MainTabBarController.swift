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
        self.hideKeyboardWhenTappedAround() // tp hide keyboard..
        navigationController?.isNavigationBarHidden = false
        setupTabBar()
        configrationNavigationBar()
    }
    func setupTabBar(){
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: YClolr], for: .selected) // for text color
        UITabBar.appearance().tintColor = YClolr// for icon color

        print("hello")
        
        let clanderController = UINavigationController(rootViewController: CalenderViewController())
        clanderController.tabBarItem.image = UIImage(named: "iconCalenderWhite")
        clanderController.tabBarItem.selectedImage = UIImage(named: "iconCalenderDark")?.withRenderingMode(.alwaysTemplate)
        clanderController.title = "Calender"
        
        
        
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
        navigationItem.title = ""
//        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        

        
    }
    @objc func handleMenuToggle(){
        print("Main")
        
    }
    
    
}
