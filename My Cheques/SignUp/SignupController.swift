//
//  SignupController.swift
//  MySheques
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SignupController: UIViewController,UITextFieldDelegate{
    
    let  serverData = ServerData.init(error: "", success: false, token: "", id: -1)
    
    @objc  func goToHomePageAction(){
        
        let home = MainTabBarController()
        
        navigationController?.pushViewController(home, animated: true)
    }
    
    @objc func signUpBtnAction(){
        var isTrueName: Bool
        var isTrueMobileNo: Bool
        var isTruePassword: Bool
        var isTrueConfPassword:Bool
        
        guard
            let UsrName = userNameTextField.text,
            let phone = mobileNumberTextField.text,
            let psww = passwordTextField.text,
            let confirmPsw = confirmPswdTextField.text
            
            else { return }
        let nameLength  = UsrName.count
        let patternName = "[a-zA-Z ]+"
        let isEngName = UsrName.range(of: patternName, options: .regularExpression)
        
        if (isEngName == nil  || nameLength > 50){
            userNameErrorText.text = " Wrong user name."
            isTrueName = false
        }else{
            isTrueName = true
            userNameErrorText.text = ""
        }
            

        let mobileLength = phone.count
//        check if phone start 05
        let patternStart = "^05"
        let isStartTrue = phone.range(of: patternStart, options: .regularExpression)
//        check if all number english number 
        let patternLang = "[0-9]+" // for english number
        let isEngNum = phone.range(of: patternLang, options: .regularExpression)
        
        if (mobileLength != 10 || isStartTrue == nil || isEngNum == nil){
            
            isTrueMobileNo = false
            phoneErrorText.text = "Wrong phone number."
            
        }else{
            isTrueMobileNo = true
            phoneErrorText.text = ""

        }
        
        let PswLength = psww.count
        
        if(PswLength < 8 ){
            isTruePassword = false
            passwordErrorText.text = "Passwords must have at least 8 characters."
        }else{
            
            isTruePassword = true
            passwordErrorText.text = ""
        }
        
        if (psww != confirmPsw){
            isTrueConfPassword = false
            confPasswordErrorText.text = "Passwords do not match."
            
            
        }else{
            isTrueConfPassword = true
            confPasswordErrorText.text = ""

        }
        
        if ( isTrueName && isTrueMobileNo && isTruePassword && isTrueConfPassword ){
            
            postRegCall(name: UsrName, mob: phone, psw: psww)
            
            if (serverData.success == true){
                
                goToHomePageAction()
                
            }else{
                
                let alert :UIAlertController = UIAlertController(title: "Error", message: "This user already exists.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: false, completion: nil)
                
            }
            
        }
        
        //        for Console:::
        print(UsrName)
        print(phone)
        print(psww)
        
    }
    
    
    func postRegCall(name:String ,mob:String, psw:String) {
        let Url = String(format: "http://192.168.100.116:9091/api/signUp")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["user_name": name,"user_phone": mob, "user_password":psw]
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
    
    
    
    
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let usr = userNameTextField.text, !usr.isEmpty,
            let mobile = mobileNumberTextField.text, !mobile.isEmpty,
            let pswd = passwordTextField.text, !pswd.isEmpty,
            let confirmPswd = confirmPswdTextField.text, !confirmPswd.isEmpty
            
            else {
                signupButton.isEnabled = false
                return
        }
        signupButton.isEnabled = true
    }
    
    
    
    let label: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 28)
        let l = UILabel()
        l.font = ffont
        l.text = "Create new account"
        l.textColor = THEME
        l.textAlignment = .center
//        l.layer.borderWidth = 2
//        l.layer.cornerRadius = 15.0
        return l
    }()
    

    let userNameTextField: UITextField = {
        
        let n = UITextField()
        
        n.attributedPlaceholder = NSAttributedString(string: "User Name",
                                                     attributes: [NSAttributedString.Key.foregroundColor: YClolr])
        n.textAlignment = .center
        n.textColor = .black
        n.backgroundColor = THEME
        n.layer.cornerRadius = 10.0
        n.layer.borderWidth = 2.0
        n.layer.borderWidth = 0
        n.keyboardType = UIKeyboardType.asciiCapable
        
        //          n.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
        return n
    }()
    
    let mobileNumberTextField: UITextField = {
        let m = UITextField()
        
        let attributedPlacholder = NSAttributedString(string: "Mobile Number", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        
        
        
        m.attributedPlaceholder = attributedPlacholder
        m.textAlignment = .center
        m.textColor = .black
        m.backgroundColor = THEME
        m.layer.cornerRadius = 10.0
        m.layer.borderWidth = 2.0
        m.layer.borderWidth  = 0
        m.keyboardType = UIKeyboardType.phonePad
        
        
        //          m.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        return m
    }()
    
    let passwordTextField: UITextField = {
        let m = UITextField()
        
        let attributedPlacholder = NSAttributedString(string: "Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        
        
        m.isSecureTextEntry.toggle()
        m.attributedPlaceholder = attributedPlacholder
        m.textAlignment = .center
        m.textColor = .black
        m.backgroundColor = THEME
        m.layer.cornerRadius = 10.0
        m.layer.borderWidth = 2.0
        m.layer.borderWidth  = 0
        //          m.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
        
        return m
    }()
    let confirmPswdTextField: UITextField = {
        let m = UITextField()
        
        let attributedPlacholder = NSAttributedString(string: "Confirm Password", attributes:[
            NSAttributedString.Key.foregroundColor : YClolr])
        
        
        m.isSecureTextEntry = true
        m.attributedPlaceholder = attributedPlacholder
        m.textAlignment = .center
        m.textColor = .black
        m.backgroundColor = THEME
        m.layer.cornerRadius = 10.0
        m.layer.borderWidth = 2.0
        m.layer.borderWidth  = 0
        //        m.setBottomBorder(backGroundColor: THEME, borderColor: YClolr)
        
        return m
    }()
    
    
    let haveAccountButton : UIButton = {
        let font = UIFont.systemFont(ofSize: 16)
        
        let btn = UIButton(type: .system)
        btn.backgroundColor = YClolr
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ",
                                                        attributes: [NSAttributedString.Key.foregroundColor:THEME,
                                                                     NSAttributedString.Key.font: font])
        
        
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes:  [NSAttributedString.Key.foregroundColor:THEME,
                                                                                   NSAttributedString.Key.font: font]))
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        
        btn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        return btn
        
    }()
    
    let signupButton: UIButton = {
        let b = UIButton(type: .system)
        
        b.setTitleColor(YClolr, for: .normal)
        b.setTitle("Sign Up", for: .normal)
        
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        b.titleLabel?.font = font
        
        b.backgroundColor = THEME
        b.layer.cornerRadius = 30.0
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(signUpBtnAction), for: .touchUpInside)
        
        
        return b
    }()
    
    
    
    @objc func signInAction (){
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = YClolr
        
        signupButton.isEnabled = false
        [userNameTextField, mobileNumberTextField, passwordTextField, confirmPswdTextField].forEach({ $0.addTarget(self,
                                                                                                                   action: #selector(editingChanged),
                                                                                                                   for:.editingChanged) })
        self.hideKeyboardWhenTappedAround() // tp hide keyboard..
        
        mobileNumberTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        mobileNumberTextField.delegate = self
        
        setupLabel()
        setupHaveAccountButton()
        setupTextFeildComponents()
        setupSignupButton()
        
//        foe error
        setupUserNameErrorText()
        setupPhoneErrorText()
        setupPasswordErrorText()
        setupConfPasswordErrorText()
        
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = mobileNumberTextField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
    let userNameErrorText: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 11)
        
        let x = UILabel()
        x.text = " "
        x.textColor = UIColor.yellow
        x.font = ffont
        x.textAlignment = .left
        
        return x
        
    }()
    
    let phoneErrorText: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 11)
        
        let x = UILabel()
        x.text = " "
        x.textColor = UIColor.yellow
        x.font = ffont
        x.textAlignment = .left
        
        return x
        
    }()
    let passwordErrorText: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 11)
        
        let x = UILabel()
        x.text = " "
        x.textColor = UIColor.yellow
        x.font = ffont
        x.textAlignment = .left
        
        return x

    }()
    let confPasswordErrorText: UILabel = {
        let ffont = UIFont.systemFont(ofSize: 11)
        
        let x = UILabel()
        x.text = " "
        x.textColor = UIColor.yellow
        x.font = ffont
        x.textAlignment = .left
        
        return x
        
    }()
    
    
    
    
    
    fileprivate func setupTextFeildComponents(){
        setupUserNameTextField()
        setupMobileNumberTextField()
        setupPasswordTextField()
        setupConfirmPswdTextField()
        
    }
    
    fileprivate func setupUserNameTextField(){
        
        
        view.addSubview(userNameTextField)
        
        //        to show:
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        //        for width and hieght:
        userNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        userNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userNameTextField.bottomAnchor.constraint(equalTo:view.centerYAnchor, constant: -80).isActive = true
        
    }
    fileprivate func setupUserNameErrorText (){
        
        view.addSubview(userNameErrorText)
        userNameErrorText.translatesAutoresizingMaskIntoConstraints = false
        
        userNameErrorText.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor,
                                               constant: 1).isActive = true
        userNameErrorText.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 25).isActive = true
        userNameErrorText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        userNameErrorText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    fileprivate func setupMobileNumberTextField(){
        
        view.addSubview(mobileNumberTextField)
        mobileNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        mobileNumberTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor,
                                                   constant: 22).isActive = true
        mobileNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        mobileNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        mobileNumberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    fileprivate func setupPhoneErrorText (){
        
        view.addSubview(phoneErrorText)
        phoneErrorText.translatesAutoresizingMaskIntoConstraints = false
        
        phoneErrorText.topAnchor.constraint(equalTo: mobileNumberTextField.bottomAnchor,constant: 1).isActive = true
        phoneErrorText.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 25).isActive = true
        phoneErrorText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        phoneErrorText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    fileprivate func  setupPasswordTextField(){
        
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.topAnchor.constraint(equalTo: mobileNumberTextField.bottomAnchor,constant: 22).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    fileprivate func setupPasswordErrorText (){
        
        view.addSubview(passwordErrorText)
        passwordErrorText.translatesAutoresizingMaskIntoConstraints = false
        
        passwordErrorText.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                               constant: 1).isActive = true
        passwordErrorText.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 25).isActive = true
        passwordErrorText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordErrorText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    fileprivate func  setupConfirmPswdTextField(){
        
        view.addSubview(confirmPswdTextField)
        confirmPswdTextField.translatesAutoresizingMaskIntoConstraints = false
        
        confirmPswdTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                                  constant: 22).isActive = true
        confirmPswdTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        confirmPswdTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confirmPswdTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    fileprivate func setupConfPasswordErrorText (){
        
        view.addSubview(confPasswordErrorText)
        confPasswordErrorText.translatesAutoresizingMaskIntoConstraints = false
        
        confPasswordErrorText.topAnchor.constraint(equalTo: confirmPswdTextField.bottomAnchor,
                                               constant: 1).isActive = true
        confPasswordErrorText.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 25).isActive = true
        confPasswordErrorText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        confPasswordErrorText.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    fileprivate func setupSignupButton(){
        view.addSubview(signupButton)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.topAnchor.constraint(equalTo: confirmPswdTextField.bottomAnchor,constant: 30).isActive = true
        signupButton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 66).isActive = true
        signupButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -66).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    fileprivate func setupLabel(){
        
        view.addSubview(label)
        label.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 50,
                      bottom: nil, bottomPad: 0,
                      left: view.leftAnchor, leftPad:0 ,
                      right: view.rightAnchor, rightPad: 0,
                      height: 25, width: 400)
    }
    
    fileprivate func setupHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.anchors(top: nil, topPad: 0,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 10,
                                  left: view.leftAnchor, leftPad: 0,
                                  right: view.rightAnchor, rightPad: 0,
                                  height: 20, width:200 )
    }
    
    
}
