//
//  ViewController.swift
//  LoginSignUp
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
class LoginController: UIViewController, UITextFieldDelegate {
    
    @objc func loginBtnAction(){
        guard
            let phone = phoneTextField.text,
            let psww = passwordTextField.text
            else { return }
        //check if start 05
        var isStartTrue = false
        let patternStart = "^05"
        let startTrue = phone.range(of: patternStart, options: .regularExpression)
        if startTrue != nil{
            isStartTrue = true
        }
        
        //        check if all number english number
        var isEngNum = false
        let engNum = Int(phone)
        if engNum != nil {
            isEngNum = true
        }
        let PswLength = psww.count
        let phoneLength = phone.count
        
        
        if (PswLength >= 8 && phoneLength == 10 && isStartTrue  && isEngNum ){
            
            API.loginPost(mobileNo: phone, password: psww) { (error: Error?, success: Bool, isSuccessfuly: Bool) in

                
                if success   {
                    
                    if isSuccessfuly{
                        
                        self.goToHomePageAction()
                    }else{
                        
                        let alert :UIAlertController = UIAlertController(title: "Wrong Phone number or password.", message: "please re-enter your information correctly", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
//                        [self.phoneTextField, self.passwordTextField].forEach({ $0.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged) })
                    }
                }else  {
                    let alert :UIAlertController = UIAlertController(title: "Error", message: "Please check connection and try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                           self.present(alert, animated: false, completion: nil)
                    
                }
                
            }//api
               
            
            
        }else {
            
            
                                   let alert :UIAlertController = UIAlertController(title: "Wrong Phone number or password.", message: "please re-enter your information correctly", preferredStyle: .alert)
                                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                   self.present(alert, animated: true, completion: nil)
            
        }
        print(phone)
        print(psww)
        
    }
    
    
    
//    @objc func editingChanged(_ textField: UITextField) {
//        if textField.text?.count == 1 {
//            if textField.text?.first == " " {
//                textField.text = ""
//                return
//            }
//        }
//        guard
//            let psw = passwordTextField.text, !psw.isEmpty,
//            let phone = phoneTextField.text, !phone.isEmpty
//
//            else {
//                loginButton.isEnabled = false
//                return
//        }
//        loginButton.isEnabled = true
//
//    }
    
    
    @objc  func signupAction(){
        
        let signupcontroller = SignupController()
        
        navigationController?.pushViewController(signupcontroller, animated: true)
        
    }
    
    @objc  func goToHomePageAction(){
        let home = MainTabBarController()
        navigationController?.pushViewController(home, animated: true)
        
    }
    
    
    @objc func forgetAction(){
        let forgetPasswordController = ForgetPasswordController()
        
        navigationController?.pushViewController(forgetPasswordController, animated: false)
    }
    
    
    
    let phoneTextField: UITextField = {
        let e = UITextField()
        
        let attributedPlacholder = NSAttributedString(string: "Phone Number", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        
        
        
        e.attributedPlaceholder = attributedPlacholder
        
        
        e.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        e.keyboardType = UIKeyboardType.phonePad
        
        
        
        return e
    }()
    let closeEyeButton: UIButton = {
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        b.contentMode = .scaleAspectFill
        b.setImage(#imageLiteral(resourceName: "closeEye").withRenderingMode(.alwaysOriginal), for: .normal)
        b.addTarget(self, action: #selector(eyeHandler), for: .touchUpInside)
        return b
        
    }()
    
    
    let openEyeButton: UIButton = {
        let b = UIButton()
        b.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        b.contentMode = .scaleAspectFill
        
        b.clipsToBounds = true
        b.setImage(#imageLiteral(resourceName: "Openeye").withRenderingMode(.alwaysOriginal), for: .normal)
        b.addTarget(self, action: #selector(eyeHandler), for: .touchUpInside)
        return b
    }()
    var IsOpen = false
    @objc func eyeHandler(){
        IsOpen = !IsOpen
        
        if (IsOpen){
            passwordTextField.rightView = openEyeButton
            passwordTextField.isSecureTextEntry = false
        }else{
            passwordTextField.rightView = closeEyeButton
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        let attributedPlacholder = NSAttributedString(string: "Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        p.isSecureTextEntry.toggle()
        p.attributedPlaceholder = attributedPlacholder
        p.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        p.rightViewMode = .always
        
        
        return p
    }()
    
    
    let loginButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitleColor(.white, for: .normal)
        b.setTitle("Log In", for: .normal)
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        b.titleLabel?.font = font
        b.backgroundColor = YClolr
        b.layer.cornerRadius = 30.0
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
        
        return b
    }()
    
    let forgotPassword: UIButton = {
        let f = UIButton(type: .system)
        f.setTitleColor(YClolr, for: .normal)
        f.setTitle("Forgot Password? ", for: .normal)
        f.backgroundColor = THEME
        f.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
        
        return f
    }()
    
    
    
    let haveAccountButton : UIButton = {
        let font = UIFont.systemFont(ofSize: 16)
        
        let btn = UIButton(type: .system)
        btn.backgroundColor = THEME
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ",
                                                        attributes: [NSAttributedString.Key.foregroundColor:YClolr,
                                                                     NSAttributedString.Key.font: font])
        
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes:                                [NSAttributedString.Key.foregroundColor:YClolr,
                                                                                                                 NSAttributedString.Key.font: font]))
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        
        btn.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        
        return btn
        
    }()
    
    let logo: UIImageView = {
        let i = UIImageView()
        i.image = #imageLiteral(resourceName: "pic") // Image Literal
        i.layer.masksToBounds = true
        i.layer.cornerRadius = 15
        
        return i
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
        //        eye icon in password text feild
        if (IsOpen) == true{
            passwordTextField.rightView = openEyeButton
        }else{
            passwordTextField.rightView = closeEyeButton
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = THEME
        //        to hide nav par from top
        navigationController?.isNavigationBarHidden = true
        
//        loginButton.isEnabled = false
//        [phoneTextField, passwordTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        
        
        phoneTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        phoneTextField.delegate = self
        
        
        self.hideKeyboardWhenTappedAround() // tap to hide keyboard..
        setupTextFeildComponents()
        setupLoginButton()
        setupHaveAccountButton()
        setupForgotPasswordButton()
        setupAddLogo()
        passwordTextField.rightView = closeEyeButton
        
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = phoneTextField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
    
    
    
    
    
    //    change status bar color
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
        //        or light for number in status bar>>>
        
    }
    

    
    
    
    
    fileprivate func setupTextFeildComponents(){
        setupPhoneTextField()
        setupPasswordTextField()
    }
    
    fileprivate func setupAddLogo(){
        
        view.addSubview(logo)
        logo.anchors(top: nil, topPad: 0,
                     bottom: phoneTextField.topAnchor, bottomPad: 20,
                     left: nil, leftPad: 0,
                     right: nil, rightPad: 0,
                     height: 190, width: 190)
        
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    fileprivate func setupPhoneTextField (){
        view.addSubview(phoneTextField)
        
        //        to show:
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        //        phoneTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneTextField.bottomAnchor.constraint(equalTo:view.centerYAnchor, constant: -20).isActive = true
    }
    
    fileprivate func setupPasswordTextField (){
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor,constant: 15).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    

    fileprivate func setupLoginButton(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 40).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 66).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -66).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    fileprivate func setupForgotPasswordButton(){
        view.addSubview(forgotPassword)
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPassword.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 8).isActive = true
        forgotPassword.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        forgotPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        forgotPassword.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        haveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -10).isActive = true
        haveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 12).isActive = true
        haveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        haveAccountButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
   
    
}


