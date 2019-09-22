//
//  SettingsLauncher.swift
//  My Cheques
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//two view for menu > menuView,,, and collection
//for CalenderController  
import UIKit
class Setting: NSObject {
    
    let name: String
    let imageName: String
    
     init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    
}


class SettingsLauncher: NSObject, UICollectionViewDataSource,
UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let menuView = UIView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
        
        
        
    }()
    let cellId = "cellId"
    
    let settings: [Setting] = {

        return [Setting(name: "Settings", imageName: "settingsIcon1"),
                Setting(name: "Notification", imageName: "iconNotificationDark"),
                Setting(name: "Log Out", imageName: "logoutIcon1")]

    }()
    
    @objc func handleMenuToggle(){
//        print("Handle")
        //        show menu
        
        
        if let window = UIApplication.shared.keyWindow{
            
            menuView.backgroundColor = YClolr.withAlphaComponent(0.15)
            window.addSubview(menuView)
            window.addSubview(collectionView)
            collectionView.backgroundColor = YClolr
            let xx:CGFloat = window.frame.width / 2
            collectionView.frame = CGRect.init(x: 0, y: 0, width: xx, height: window.frame.height)
            menuView.frame = window.frame
            menuView.alpha = 0
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.menuView.alpha = 1
                
                self.collectionView.frame = CGRect.init(x: 0, y: 0, width: self.collectionView.frame.width,
                                                        height: self.collectionView.frame.height)
            }, completion: nil)

           
            
        }
        
    }
    @objc func handleDismiss(){
        
        UIView.animate(withDuration: 0.12) {
            self.menuView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                let xx:CGFloat = window.frame.width / 2

                self.collectionView.frame = CGRect.init(x: -xx, y: 0, width: self.collectionView.frame.width,
                                                   height: self.collectionView.frame.height)

            }
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as! SettingCell
        let setting = settings[indexPath.item]
        cell.setting = setting
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    } // for line space
    
    var calenderController: CalenderViewController?
    var chequesBooksController : ChequesBooksViewController?
    var receivedChequesController: ReceivedChequesViewController?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        handleDismiss()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut , animations: {
            self.menuView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                let xx:CGFloat = window.frame.width / 2
                
                self.collectionView.frame = CGRect.init(x: -xx, y: 0, width: self.collectionView.frame.width,
                                                        height: self.collectionView.frame.height)
            }
        }) { (completed:Bool) in
            
            let setting = self.settings[indexPath.item]
            
            if setting.name == "Settings"{
                
            self.calenderController?.showSettings(setting: setting)
            self.chequesBooksController?.showSettings(setting: setting)
            self.receivedChequesController?.showSettings(setting: setting)

                
            }
            if setting.name == "Notification"{
                
                self.calenderController?.showNotifications(setting: setting)
                self.chequesBooksController?.showNotifications(setting: setting)
                self.receivedChequesController?.showNotifications(setting: setting)
                
            }
            if setting.name == "Log Out"{
           
                self.calenderController?.showLogout(setting: setting)
                self.chequesBooksController?.showLogout(setting: setting)
                self.receivedChequesController?.showLogout(setting: setting)
            }
        }
        
    
    }
   
   
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingCell.self,
                                forCellWithReuseIdentifier: cellId)

    }
}
