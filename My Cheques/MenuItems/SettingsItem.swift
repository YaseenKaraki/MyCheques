//
//  text.swift
//  My Cheques
//
//  Created by Apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SettingItem: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuplabel()
        // Do any additional setup after loading the view.
        view.backgroundColor = YClolr
    }
    let label: UILabel = {
        
        let l = UILabel()
        l.text = "Welcome To Settings:"
        return l
        
    }()
    
   fileprivate func setuplabel (){
    view.addSubview(label)
    label.anchors(top: view.safeAreaLayoutGuide.bottomAnchor, topPad: 60,
                  bottom: nil, bottomPad: 0,
                  left: view.leftAnchor, leftPad:0 ,
                  right: view.rightAnchor, rightPad: 0,
                  height: 25, width: 400)
    
    
    
    
    }
    
    
}
