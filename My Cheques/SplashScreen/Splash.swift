//
//  splash.swift
//  My Cheques
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class splash: UIViewController{
    
    
    let logo: UIImageView = {
        let i = UIImageView()
        //        i.image = #imageLiteral(resourceName: "pic") // Image Literal
        i.image = #imageLiteral(resourceName: "logo2")
        i.layer.masksToBounds = true
        i.layer.cornerRadius = 15
        return i
    }()
    
    
    
    fileprivate func setupAddLogo(){
        
        view.addSubview(logo)
        
        logo.anchors(top: view.safeAreaLayoutGuide.centerYAnchor, topPad:-90,
                     bottom: nil, bottomPad: 0,
                     left: nil, leftPad: 0,
                     right: nil, rightPad: 0,
                     height: 190, width: 190)
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = YClolr
        //        to hide nav par from top
        navigationController?.isNavigationBarHidden = true
        
        
        setupAddLogo()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dissmissSplashContreller), userInfo: nil, repeats: false)

    }
    @objc func dissmissSplashContreller(){
        let def = UserDefaults.standard
        let tokenn = def.object(forKey: "token") as? String
           if tokenn != nil{
               
              let home = MainTabBarController()
               navigationController?.pushViewController(home, animated: false)
               
           }else{
               
               let logincontroller = LoginController()
            navigationController?.pushViewController(logincontroller, animated: false)
              
       }
    
    
}
}














