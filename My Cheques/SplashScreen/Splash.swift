//
//  splash.swift
//  My Cheques
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class splash: UIViewController{
    
    fileprivate func isLoggedIn()->Bool{
        return UserDefaults.standard.isLoggedIn()
    }
    
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
    }
        
        }
        
        

    
    
    
    
    
    






