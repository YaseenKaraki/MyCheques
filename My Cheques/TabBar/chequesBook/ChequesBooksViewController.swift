//
//  ChequesBooksViewController.swift
//  My Cheques
//
//  Created by Apple on 8/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ChequesBooksViewController: UITableViewController {         
    
    override func viewDidLoad() {
//        navigationItem.title = "Cheques Book"
        super.viewDidLoad()
        view.backgroundColor = THEME
        configrationNavigationBar()
//        register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.navigationItem.backBarButtonItem?.tintColor = .white

    }
    @objc func addBtnAction(){
        print("Added")
        let addView = AddChequeBookViewController()
        navigationController?.pushViewController(addView, animated: false)
        
    }
    
    
    
//    let floatBtn: UIButton = {
//        let b = UIButton()
//        //        b.imageView?.image = UIImage(named: "plusIcon")?.withRenderingMode(.alwaysTemplate)
//        b.setImage(UIImage(named: "plusIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        //        b.imageEdgeInsets = UIEdgeInsets(top: 56, left: 56, bottom: 56, right: 56)
//        b.tintColor = YClolr
//        b.contentMode = .scaleAspectFit
//        b.setBackgroundImage(nil, for: .normal)
//        b.clipsToBounds = true
//        b.addTarget(self, action: #selector(floatBtnAvtion), for: .touchUpInside)
//        b.layer.cornerRadius = b.frame.height / 2.0
//
//
//        return b
//
//    }()
//    @objc func floatBtnAvtion(){
//        print("Float Button")
//    }
//
//    fileprivate func setupFloatingButton(){
//        view.addSubview(floatBtn)
//        floatBtn.translatesAutoresizingMaskIntoConstraints = false
//        floatBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
//
//    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
    }

    func configrationNavigationBar (){
        navigationController?.navigationBar.barTintColor = YClolr
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = THEME
        
        
        
        
        //        add + item on navpar
       
        let img = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
    
        navigationItem.rightBarButtonItem?.tintColor = .white
        let rightBtn = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(addBtnAction))
        navigationItem.setRightBarButton(rightBtn, animated: true)
    }
    
    
    
    
    
    lazy var settingLauncher: SettingsLauncher = {
        let s = SettingsLauncher()
        s.chequesBooksController = self
        return s
        
        
    }()
    
    @objc func handleMenuToggle(){
        print("HandleCalender from chequesBooks")
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
//    number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
////    heder for section
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.text = "Hello"
//        label.backgroundColor = YClolr
//        return label
//    }
    
//    mumber of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
   
//    celll for each row
    let cellId = "cellID"
    let names = ["Cheque Book1","Cheque Book2","Cheque Book3","Cheque Book4"]
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let name = self.names[indexPath.row]
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = "2018-17-9"
        cell.imageView?.image = UIImage(named: "table")?.withRenderingMode(.alwaysTemplate)
        cell.imageView?.tintColor = YClolr
        
//        cell.imageView?.sizeThatFits(CGSize(width: 5, height: 5))
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 30 , height: 30)
        
        cell.imageView?.clipsToBounds = true

        return cell
    }


    
}

