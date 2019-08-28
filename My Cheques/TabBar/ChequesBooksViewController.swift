//
//  ChequesBooksViewController.swift
//  My Cheques
//
//  Created by Apple on 8/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ChequesBooksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME
        configrationNavigationBar()

        
    }
    func configrationNavigationBar (){
        navigationController?.navigationBar.barTintColor = YClolr
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Cheques Book"
        
       
        
    }


    
}
