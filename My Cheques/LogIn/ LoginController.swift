//
//  ViewController.swift
//  LoginSignUp
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit




class LoginController: UIViewController, UITextFieldDelegate {
    


    func postLoginCall(mob:String, psw:String) {
        let Url = String(format: "http://192.168.100.108:9091/api/auth")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["user_phone": mob, "user_password":psw]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: [])
                    if let serverData = ServerData(JSON: JSON){
                        print(serverData)
                    }

                    print(JSON)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
//    func isStringContainsOnlyNumbers(string: String) -> Bool {
//        return string.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) != nil
//    }
    
    
    
    @objc func loginBtnAction(){
        guard
            let phone = phoneTextField.text,
            let psww = passwordTextField.text
            else { return }
        let patternStart = "^05"
        let isStartTrue = phone.range(of: patternStart, options: .regularExpression)
        //        check if all number english number
        let patternLang = "[0-9]+" // for english number
        let isEngNum = phone.range(of: patternLang, options: .regularExpression)
        
        let PswLength = psww.count
        let phoneLength = phone.count
        
        
        if (PswLength >= 8 && phoneLength == 10 && isStartTrue != nil && isEngNum != nil){
            postLoginCall(mob: phone, psw: psww)
            
            goToHomePageAction()
        }
            
        else {
            
            let alert :UIAlertController = UIAlertController(title: "Wrong Phone number or password.", message: "please re-enter your information correctly", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            [phoneTextField, passwordTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })

            
        }
        print(phone)
        print(psww)
        
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
            let phone = phoneTextField.text, !phone.isEmpty
            
            else {
                loginButton.isEnabled = false
                return
        }
        loginButton.isEnabled = true
        
    }
    
    
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
        //        e.backgroundColor = THEME
        //        e.layer.borderColor = UIColor.white.cgColor
        //        e.layer.borderWidth = 2
        
        e.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        e.keyboardType = UIKeyboardType.phonePad
        
        
        
        return e
    }()
    
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        let attributedPlacholder = NSAttributedString(string: "Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        p.isSecureTextEntry.toggle()
        
        p.attributedPlaceholder = attributedPlacholder
        //        p.backgroundColor = THEME
        //        p.layer.borderColor = UIColor.white.cgColor
        //        p.layer.borderWidth = 2
        
        p.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
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
        
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes:  [NSAttributedString.Key.foregroundColor:YClolr,
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = THEME
        //        to hide nav par from top
        navigationController?.isNavigationBarHidden = true
        
        loginButton.isEnabled = false
        [phoneTextField, passwordTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        

        
        phoneTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        phoneTextField.delegate = self
        

        self.hideKeyboardWhenTappedAround() // tp hide keyboard..
        setupAddLogo()
        setupTextFeildComponents()
        setupLoginButton()
        setupHaveAccountButton()
        setupForgotPasswordButton()
  
        
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
    
    
    fileprivate func setupAddLogo(){
        
        view.addSubview(logo)
        logo.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 90,
                     bottom: nil, bottomPad: 0,
                     left: nil, leftPad: 0,
                     right: nil, rightPad: 0,
                     height: 190, width: 190)
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    
    
    fileprivate func setupTextFeildComponents(){
        setupPhoneTextField()
        setupPasswordTextField()
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
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 30).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
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
//    let nameError: UITextView = {
//        let textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.textAlignment = .left
//        textView.textColor = .black
//        textView.backgroundColor = THEME
//        textView.isEditable = false
//        //        textView.de = false
//        textView.font = UIFont.systemFont(ofSize: 18)
//        textView.text = "HEEEEEE"
//
//
//
//        return textView
//
//    }()

//    fileprivate func setupErrorView(){
//    view.addSubview(nameError)
//
//       nameError.translatesAutoresizingMaskIntoConstraints = false
//       nameError.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 26).isActive = true
//       nameError.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 12).isActive = true
//       nameError.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
//       nameError.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
//
//    }
//
    
    

}


