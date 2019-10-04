//
//  UserDefaults.swift
//  My Cheques
//
//  Created by Apple on 8/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    func setIsloggedin(value: Bool){
        
        set(value, forKey: "isLoggedIn")
        synchronize()
        
    }
    func isLoggedIn()-> Bool{
        
        return bool(forKey: "isLoggedIn")
        
    }
    
}
