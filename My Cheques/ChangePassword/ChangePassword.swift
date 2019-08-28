//
//  changePassword.swift
//  My Cheques
//
//  Created by Apple on 8/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import Foundation
class ChangePasswordController: UIViewController, UITextFieldDelegate{
    
    
    @objc func  goLoginAction(){
        let login = LoginController()
        navigationController?.pushViewController(login, animated: true)
        
    }
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let psw = passwordTextField.text, !psw.isEmpty,
            let confirmPsw = confirmpPasswordTextField.text, !confirmPsw.isEmpty,
            let pin = pinTextField.text, !pin.isEmpty
            else {
                updatePasswordButton.isEnabled = false
                return
        }
        updatePasswordButton.isEnabled = true
    }
    
    
    
    @objc  func reSendAction(){
        //        here code for resend Pin code <<<<>>>>
    }
    
    @objc  func updatePasswordAction(){
        //        here code for update password <<<<>>>>
        //        then go to login page
        let login = LoginController()
        navigationController?.pushViewController(login, animated: true)
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = THEME
        //        to hide nav par from top
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.barTintColor = YClolr
        view.backgroundColor = YClolr
        updatePasswordButton.isEnabled = false
        [passwordTextField, confirmpPasswordTextField, pinTextField].forEach({ $0.addTarget(self,
                                                                                            action: #selector(editingChanged),
                                                                                            for:.editingChanged) })
        
        
        self.hideKeyboardWhenTappedAround() // tp hide keyboard..
        
        
        setupLabel()
        setupPinTextField()
        setupPasswordTextField()
        setupConfirmPasswordTextField()
        setupResendPinButton()
        setupUpdatePasswordButton()
        setupGoLoginButton()
        
    }
    
    let label: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 28)
        let l = UILabel()
        l.font = ffont
        l.text = "Reset password page"
        l.textColor = THEME
        l.textAlignment = .center
        return l
    }()
    let pinTextField: UITextField = {
        let p = UITextField()
        let attributedPlacholder = NSAttributedString(string: " Pin Code", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        p.attributedPlaceholder = attributedPlacholder
        p.layer.cornerRadius = 10.0
        p.layer.borderWidth = 2.0
        p.layer.borderWidth = 0
        p.keyboardType = UIKeyboardType.alphabet
        
        p.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        return p
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        let attributedPlacholder = NSAttributedString(string: " New Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        p.isSecureTextEntry.toggle()
        p.attributedPlaceholder = attributedPlacholder
        p.layer.cornerRadius = 10.0
        p.layer.borderWidth = 2.0
        p.layer.borderWidth = 0
        p.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
        
        return p
    }()
    let confirmpPasswordTextField: UITextField = {
        let p = UITextField()
        let attributedPlacholder = NSAttributedString(string: " Confirm Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        p.isSecureTextEntry.toggle()
        p.attributedPlaceholder = attributedPlacholder
        p.layer.cornerRadius = 10.0
        p.layer.borderWidth = 2.0
        p.layer.borderWidth = 0
        p.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
        return p
    }()
    
    let goLoginButton : UIButton = {
        
        let font = UIFont.systemFont(ofSize: 16)
        let btn = UIButton(type: .system)
        btn.backgroundColor = YClolr
        let attributedTitle = NSMutableAttributedString(string: "Login Page",
                                                        attributes: [NSAttributedString.Key.foregroundColor:THEME,
                                                                     NSAttributedString.Key.font: font])
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.addTarget(self, action: #selector(goLoginAction), for: .touchUpInside)
        
        return btn
        
    }()
    fileprivate func setupLabel(){
        
        view.addSubview(label)
        label.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 25,
                      bottom: nil, bottomPad: 0,
                      left: view.leftAnchor, leftPad:0 ,
                      right: view.rightAnchor, rightPad: 0,
                      height: 25, width: 400)
        
    }
    
    
    
    let resendPinButton : UIButton = {
        let font = UIFont(name: "ChalkboardSE-Bold", size: 14)
        
        //        let font = UIFont.systemFont(ofSize: 14)
        let btn = UIButton(type: .system)
        btn.backgroundColor = YClolr
        let attributedTitle = NSMutableAttributedString(string: "Resend pin code?",
                                                        attributes: [NSAttributedString.Key.foregroundColor:THEME,
                                                                     NSAttributedString.Key.font: font as Any])
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.addTarget(self, action: #selector(reSendAction), for: .touchUpInside)
        
        return btn
        
    }()
    let updatePasswordButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitleColor(YClolr, for: .normal)
        b.setTitle("Update Password", for: .normal)
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        b.titleLabel?.font = font
        b.backgroundColor = THEME
        b.layer.cornerRadius = 30.0
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(updatePasswordAction), for: .touchUpInside)
        
        return b
        
    }()
    fileprivate func setupPinTextField (){
        view.addSubview(pinTextField)
        
        
        
        pinTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        pinTextField.topAnchor.constraint(equalTo:label.bottomAnchor,constant: 55).isActive = true
        pinTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        pinTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        pinTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    fileprivate func setupPasswordTextField (){
        view.addSubview(passwordTextField)
        
        
        //        to show:
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        passwordTextField.topAnchor.constraint(equalTo:pinTextField.bottomAnchor,constant: 15).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    fileprivate func setupConfirmPasswordTextField (){
        view.addSubview(confirmpPasswordTextField)
        
        //        to show:
        confirmpPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        confirmpPasswordTextField.topAnchor.constraint(equalTo:passwordTextField.bottomAnchor,constant: 15).isActive = true
        confirmpPasswordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        confirmpPasswordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        confirmpPasswordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    fileprivate func setupResendPinButton(){
        view.addSubview(resendPinButton)
        resendPinButton.translatesAutoresizingMaskIntoConstraints = false
        resendPinButton.topAnchor.constraint(equalTo: confirmpPasswordTextField.bottomAnchor, constant: 10).isActive = true
        resendPinButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        resendPinButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-60).isActive = true
        resendPinButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    fileprivate func setupUpdatePasswordButton(){
        view.addSubview(updatePasswordButton)
        updatePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        updatePasswordButton.topAnchor.constraint(equalTo: resendPinButton.bottomAnchor, constant: 20).isActive = true
        updatePasswordButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 60).isActive = true
        updatePasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-60).isActive = true
        updatePasswordButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    fileprivate func setupGoLoginButton(){
        view.addSubview(goLoginButton)
        goLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        goLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        goLoginButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 12).isActive = true
        goLoginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        goLoginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
