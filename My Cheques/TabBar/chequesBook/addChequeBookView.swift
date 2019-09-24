//
//  ViewController.swift
//  My Cheques
//
//  Created by Apple on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//


let font = UIFont(name: "Palatino-Roman", size: 16)
import SkyFloatingLabelTextField
class AddChequeBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var banksNameArray = [String](arrayLiteral: "","")
    var currencyNameArray = [String](arrayLiteral: "","")
    var numberOfPaperArray = [String](arrayLiteral: "","")

    
    let chequebookNameTextFeild: SkyFloatingLabelTextField = {
        let t = SkyFloatingLabelTextField()
        t.placeholder = "Name"
        t.title = "Cheque Book Name:"
        t.tintColor = YClolr // the color of the blinking cursor 
        t.textColor = UIColor.darkGray
        t.lineColor = UIColor.darkGray
        t.font = font
        t.titleColor = YClolr
        t.selectedTitleColor = YClolr
        t.selectedLineColor = YClolr
        t.lineHeight = 1.0 // bottom line height in points
        t.selectedLineHeight = 2.0
        t.autocorrectionType = .no
        return t
    }()
    
    let bankNameTextfield: SkyFloatingLabelTextField = {
        let b = SkyFloatingLabelTextField()
        b.font = font
        b.placeholder = "Select Bank"
        b.title = "Bank Name"
        b.lineColor = UIColor.darkGray
        b.titleColor = YClolr
        b.selectedTitleColor = YClolr
        b.selectedLineColor = YClolr
        b.lineHeight = 1.0 // bottom line height in points
        b.selectedLineHeight = 2.0
        b.textColor = UIColor.darkGray
        
        return b
    }()
    
    let currencyTextfield: SkyFloatingLabelTextField = {
           let b = SkyFloatingLabelTextField()
           b.font = font
           b.placeholder = "Select Currency"
           b.title = "Currency"
           b.titleColor = YClolr
           b.selectedTitleColor = YClolr
           b.selectedLineColor = YClolr
           b.lineColor = UIColor.darkGray
           b.lineHeight = 1.0 // bottom line height in points
           b.selectedLineHeight = 2.0
           b.textColor = UIColor.darkGray
           
           return b
       }()
    
    let numberOfPaperTextfield: SkyFloatingLabelTextField = {
           let b = SkyFloatingLabelTextField()
           b.font = font
           b.placeholder = "Select papers number"
           b.title = "Number of papers"
           b.titleColor = YClolr
           b.selectedTitleColor = YClolr
           b.selectedLineColor = YClolr
           b.lineColor = UIColor.darkGray
           b.lineHeight = 1.0 // bottom line height in points
           b.selectedLineHeight = 2.0
           b.textColor = UIColor.darkGray
           b.keyboardType = .numberPad
           return b
       }()
    
    let createBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Create", for: .normal)
        btn.setTitleColor(.white, for: .normal)
         let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        btn.titleLabel?.font = font
        btn.backgroundColor = YClolr
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(createBtnAction), for: .touchUpInside)
        
        return btn
    }()
    @objc func createBtnAction(){
        print("Create")
    }
    
    
    let cancelBtn: UIButton = {
           let btn = UIButton()
           btn.setTitle("Cancel", for: .normal)
           btn.setTitleColor(.white, for: .normal)
            let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
           btn.titleLabel?.font = font
           btn.backgroundColor = YClolr
           btn.layer.cornerRadius = 5
           btn.clipsToBounds = true
           btn.addTarget(self, action: #selector(cancleBtnAction), for: .touchUpInside)
           
           return btn
       }()
       @objc func cancleBtnAction(){
           print("Cancel")
        self.navigationController?.popViewController(animated: false)
       }
    
    
    let banksNamePicker = UIPickerView()
    let currencyNamePicker = UIPickerView()
    let numberOfPaperPicker = UIPickerView()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = BColor
        self.navigationItem.title = "Create Cheque Book"
        
        setupBookNameTextFeild()
        setupBankNameTextFeild()
        setupCurrencyTextFeild()
        setupNumberOfpapersTextFeild()
        setupCreateBtn()
        setupCancleBtn()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
//        change backround color for picker
        banksNamePicker.backgroundColor = YClolr
        currencyNamePicker.backgroundColor = YClolr
        numberOfPaperPicker.backgroundColor = YClolr
//        set picker for text feild
        bankNameTextfield.inputView = banksNamePicker
        currencyTextfield.inputView = currencyNamePicker
        numberOfPaperTextfield.inputView = numberOfPaperPicker
        
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

        currencyNameArray = ["Jordanian Dinar - JD","United States Dollar - USD" , "Israeli New Shekel - ILS"]
        numberOfPaperArray = ["10","15","20","30","Other"]
        
        banksNamePicker.delegate = self
        currencyNamePicker.delegate = self
        numberOfPaperPicker.delegate = self
        
        

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
            }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == banksNamePicker{
            return banksNameArray.count
        }
       else if pickerView == currencyNamePicker{
            return currencyNameArray.count
        }else{
            
            return numberOfPaperArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == banksNamePicker{
                   return banksNameArray[row]
               }
              else  if pickerView == currencyNamePicker {
                   return currencyNameArray[row]
        }else{
            return numberOfPaperArray[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == banksNamePicker {// begin for banks name picker
        if banksNameArray[row] == "Other"{
        bankNameTextfield.text = ""
        bankNameTextfield.placeholder = "Enter Bank Name"
       bankNameTextfield.inputView = nil
        }
        else{
            bankNameTextfield.text = banksNameArray[row]
        }
        }// end for banks name picker
            
        //  for currency
        else if pickerView == currencyNamePicker{
            currencyTextfield.text = currencyNameArray[row]
        } else {
            
            if numberOfPaperArray[row] == "Other"{
                   numberOfPaperTextfield.text = ""
                   numberOfPaperTextfield.placeholder = "Number of papers"
                   numberOfPaperTextfield.inputView = nil
                   }
                   else{
                       numberOfPaperTextfield.text = numberOfPaperArray[row]
                   }
        }
    }
    
    ////    change color text for picker
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
         if pickerView == banksNamePicker { // for banks name title
            
                let titleData = banksNameArray[row]
                let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Helvetica", size: 17.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
                return myTitle
            
         }else if pickerView == currencyNamePicker {// for currency title
                let titleData = currencyNameArray[row]
                let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Helvetica", size: 17.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
                return myTitle
            
         }else{

                let titleData = numberOfPaperArray[row]
                let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Helvetica", size: 17.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
                return myTitle
            
        }
        
    }
    fileprivate func setupBookNameTextFeild(){
        view.addSubview(chequebookNameTextFeild)
        
        chequebookNameTextFeild.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 50,
                                        bottom: nil, bottomPad: 0,
                                        left: view.leftAnchor, leftPad: 30,
                                        right: view.rightAnchor, rightPad: 30,
                                        height: 40 , width: 0)
    }
    
    fileprivate func setupBankNameTextFeild(){
        
        view.addSubview(bankNameTextfield)
        bankNameTextfield.anchors(top: chequebookNameTextFeild.bottomAnchor, topPad: 30,
                             bottom: nil, bottomPad: 0,
                             left: view.leftAnchor, leftPad: 30,
                             right: view.rightAnchor, rightPad: 30,
                             height: 40 , width: 0)
    }
    
    fileprivate func setupCurrencyTextFeild(){
        
        view.addSubview(currencyTextfield)
        currencyTextfield.anchors(top: bankNameTextfield.bottomAnchor, topPad: 30,
        bottom: nil, bottomPad: 0,
        left: view.leftAnchor, leftPad: 30,
        right: view.centerXAnchor, rightPad: 15 ,
        height: 40 , width: 0)
    }
    
    fileprivate func setupNumberOfpapersTextFeild(){
        
        view.addSubview(numberOfPaperTextfield)
        numberOfPaperTextfield.anchors(top: bankNameTextfield.bottomAnchor, topPad: 30,
        bottom: nil, bottomPad: 0,
        left: view.centerXAnchor, leftPad: 5,
        right: view.rightAnchor, rightPad: 30 ,
        height: 40 , width: 0)
    }
    fileprivate func setupCreateBtn(){
        view.addSubview(createBtn)
        createBtn.anchors(top: currencyTextfield.bottomAnchor, topPad: 55,
        bottom: nil, bottomPad: 0,
        left: view.centerXAnchor, leftPad: 15,
        right: view.rightAnchor, rightPad: 30 ,
        height: 50 , width: 0)
        
        
    }
    fileprivate func setupCancleBtn(){
        view.addSubview(cancelBtn)
        cancelBtn.anchors(top: currencyTextfield.bottomAnchor, topPad: 55,
        bottom: nil, bottomPad: 0,
        left: view.leftAnchor, leftPad: 30,
        right: view.centerXAnchor, rightPad: 15 ,
        height: 50 , width: 0)
    }
    
    
}
