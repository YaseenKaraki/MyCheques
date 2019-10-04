//
//  SettingsCell.swift
//  My Cheques
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
class SettingCell: BaseCell {
    
    override var isHighlighted: Bool{
        didSet {
            backgroundColor = isHighlighted ? HighlighColor : YClolr // if... else....
            nameLabel.textColor = isHighlighted ? UIColor.darkText : UIColor.white
            iconImageView.tintColor = isHighlighted ?   UIColor.darkText : UIColor.white
            //            print("high lihted")
            
        }
        
        
    }
    
    
    var setting: Setting? {
        didSet{
            
            nameLabel.text = setting?.name
            if let imageName =  setting?.imageName{
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                
                iconImageView.tintColor = UIColor.white
            }
        }
        
        
        
        
    }
    
    let nameLabel: UILabel = {
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        
        let l = UILabel()
        l.text = "Settings"
        l.textColor = THEME
        l.font = font
        return l
        
        
    }()
    let iconImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "settingsIcon1" )
        //        img.image?.withRenderingMode(.alwaysTemplate)
        //        img.mask?.backgroundColor = .white
        img.contentMode = .scaleAspectFill
        
        
        
        return img
        
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        addConstraintWithFormats(format: "H:|-15-[v0(30)]-8-[v1]|", views:iconImageView, nameLabel)
        
        addConstraintWithFormats(format: "V:|[v0]|", views: nameLabel)
        addConstraintWithFormats(format: "V:[v0(30)]", views: iconImageView) // for hieght
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY , relatedBy: .equal, toItem:self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
}
