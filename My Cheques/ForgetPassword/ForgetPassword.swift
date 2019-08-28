//
//  forgetPassword.swift
//  My Cheques
//
//  Created by Apple on 8/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit

import Foundation
class ForgetPasswordController: UIViewController, UITextFieldDelegate{
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                
                return
            }
        }
        
        guard
            let phone = phoneTextField.text, !phone.isEmpty
            
            else {
                self.changePasswordButton.isEnabled = false
                return
        }
        changePasswordButton.isEnabled = true
    }
    
    @objc func signInAction (){
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc  func changePasswordAction(){
        
        let changePasswordController = ChangePasswordController()
        navigationController?.pushViewController(changePasswordController, animated: true)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME
        //        to hide nav par from top
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.barTintColor = YClolr
        view.backgroundColor = YClolr
        
        
        changePasswordButton.isEnabled = false
        [phoneTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        
        
        
        //    for limited number 1-
        phoneTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        phoneTextField.delegate = self
        
        self.hideKeyboardWhenTappedAround() // tp hide keyboard..
        
        
        setupLabel()
        setupPhoneTextField()
        steupChangePasswordButton()
        steupBackButton()
    }
    //    for limited number 2-
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = phoneTextField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
    
    
    
    
    let label: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 28)
        let l = UILabel()
        l.font = ffont
        l.text = "Restore Password"
        l.textColor = THEME
        l.textAlignment = .center
        return l
    }()
    
    
    fileprivate func setupLabel(){
        
        view.addSubview(label)
        label.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 25,
                      bottom: nil, bottomPad: 0,
                      left: view.leftAnchor, leftPad:0 ,
                      right: view.rightAnchor, rightPad: 0,
                      height: 25, width: 400)
        
        
        
        
    }
    
    
    
    
    let phoneTextField: UITextField = {
        let e = UITextField()
        
        let attributedPlacholder = NSAttributedString(string: "Phone Number", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        e.textAlignment = .center
        e.layer.cornerRadius = 10.0
        e.layer.borderWidth = 2.0
        e.layer.borderWidth = 0
        
        e.attributedPlaceholder = attributedPlacholder
        //        e.backgroundColor = THEME
        //        e.layer.borderColor = UIColor.white.cgColor
        //        e.layer.borderWidth = 2
        
        e.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        e.keyboardType = .numberPad
        
        
        return e
    }()
    
    
    let changePasswordButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitleColor(.white, for: .normal)
        b.setTitle("Change Password ", for: .normal)
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        b.titleLabel?.font = font
        b.backgroundColor = YClolr
        //        b.layer.borderColor = UIColor.white.cgColor
        //        b.layer.borderWidth = 0.4
        //        b.layer.cornerRadius = 25
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(changePasswordAction), for: .touchUpInside)
        
        return b
    }()
    
    let backButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitleColor(.white, for: .normal)
        b.setTitle("Back", for: .normal)
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        b.titleLabel?.font = font
        b.backgroundColor = YClolr
        b.layer.cornerRadius = 30.0
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        return b
    }()
    
    fileprivate func setupPhoneTextField (){
        view.addSubview(phoneTextField)
        
        //        to show:
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        phoneTextField.topAnchor.constraint(equalTo:label.bottomAnchor,constant: 55).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        
        
    }
    
    fileprivate func steupChangePasswordButton(){
        
        view.addSubview(changePasswordButton)
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        changePasswordButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor,constant: 5).isActive = true
        changePasswordButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 66).isActive = true
        changePasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -66).isActive = true
        changePasswordButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    fileprivate func steupBackButton(){
        
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor,constant: 18).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 100).isActive = true
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    
    
}
