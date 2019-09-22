//
//  ViewController.swift
//  fromLets
//
//  Created by Apple on 8/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        return menu
        
    }()
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        //        menuBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        view.backgroundColor = UIColor.cyan
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        //        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titelLabel.text = "Home"
        titelLabel.textColor = .white
        titelLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titelLabel
        
       
        setupMenuBar()
        setupNavBarButtons()
    }
    func setupNavBarButtons(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        
        
    }
    
    
    @objc func handleMenuToggle(){
        print ("123")
    }
  
    
    
    
}

extension UIView {
    
    func addConstraintsWithFormat (format: String, views: UIView...){
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
            
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
        
    }
    
    
}
