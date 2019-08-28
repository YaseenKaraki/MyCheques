//
//  MainNavigationController.swift
//  My Cheques
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn(){
            
            
            let home = MainTabBarController()
            viewControllers = [home]
        }else{
            
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
            
        }
        
        }
    fileprivate func isLoggedIn() ->Bool{
        
        return false
    }
    
    @objc func showLoginController(){
        
        let loginController = LoginController()
        present(loginController, animated: true) {
            // code
        }
        
    }
    

    

}
