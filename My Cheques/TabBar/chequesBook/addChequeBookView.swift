//
//  ViewController.swift
//  My Cheques
//
//  Created by Apple on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddChequeBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var banksNameArray = [String](arrayLiteral: "Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy")
    
    
    
    let bankTextfield: UITextField = {
        let b = UITextField()

        let attributedPlacholder = NSAttributedString(string: "Select Bank", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        b.attributedPlaceholder = attributedPlacholder
        b.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        return b
    }()
    
    let thePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BColor
        self.navigationItem.title = "Add Cheque Book"
        
 

        view.addSubview(bankTextfield)
        bankTextfield.anchors(top: view.centerYAnchor, topPad: 50,
                      bottom: nil, bottomPad: 0,
                      left: view.leftAnchor, leftPad:0 ,
                      right: view.rightAnchor, rightPad: 0,
                      height: 25, width: 400)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
//        change backround color for picker
        thePicker.backgroundColor = YClolr
//        set picker for text feild
        bankTextfield.inputView = thePicker

        banksNameArray = ["Bank of Palestine",
                          "Arab Islamic Bank",
                          "Palestine Islamic Bank",
                          "Palestine Investment Bank",
                          "Al Quds Bank",
                          "The National Bank TNB",
                          "Safa Bank",
                          "Arab Bank",
                          "Cairo Amman Bank",
                          "Bank of Jordan",
                          "Housing Bank",
                          "Egyptian Arab Land Bank",
                          "Jordan Ahli Bank",
                          "Commercial Bank of Jordan",
                          "Jordan Kuwait Bank",
                          "Other"]

        thePicker.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
            }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return banksNameArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return banksNameArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if banksNameArray[row] == "Other"{
        bankTextfield.text = ""
        bankTextfield.placeholder = ""
        }
        else{
            bankTextfield.text = banksNameArray[row]
        }
        
    }
    
    ////    change color text for picker
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = banksNameArray[row]
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Helvetica", size: 17.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
        
        return myTitle
        
    }
    
    
}
