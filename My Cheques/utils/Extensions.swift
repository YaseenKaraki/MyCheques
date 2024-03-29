//
//  Extensions.swift
//  LoginSignUp
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
extension UIView {
    func anchors(top: NSLayoutYAxisAnchor?, topPad: CGFloat, bottom: NSLayoutYAxisAnchor?, bottomPad: CGFloat,
                 left: NSLayoutXAxisAnchor?, leftPad: CGFloat, right: NSLayoutXAxisAnchor?, rightPad: CGFloat,
                 height: CGFloat, width: CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPad).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
        }
        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: -rightPad).isActive = true
        }
        
        if height > 0 {self.heightAnchor.constraint(equalToConstant: height).isActive = true}
        if width > 0 {self.widthAnchor.constraint(equalToConstant: width).isActive = true}
        
        
    }
    
}


extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}


extension UITextField {
    
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor) {
        self.layer.backgroundColor = backGroundColor.cgColor
        
        // defines the layers shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = borderColor.cgColor
        self.layer.borderColor = borderColor.cgColor
    }
}



extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

//extension ViewController: HideShowPasswordTextFieldDelegate {
//    func isValidPassword(_ password: String) -> Bool {
//        return password.count > 7
//    }
//
//}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
}
extension UIView{
    func addConstraintWithFormats(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions.init(), metrics: nil, views: viewsDictionary))
        
        
        
    }
    
    
    
    
}


