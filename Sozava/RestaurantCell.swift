//
//  MenuCell.swift
//  AlloResto
//
//  Created by Esso Awesso on 27/02/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    
    
    let menuImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    let logoImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        //imageView.image = UIImage(named: "Hippo.png")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let menuTitleLabel : UILabel = {
        
        let label = UILabel()
        label.text = "Riz cantonais"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Cochin", size: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let specialiteLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Japonais"
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "30min"
        label.textColor = UIColor.purple
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLine : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        addSubview(menuImageView)
        addSubview(separatorLine)
        addSubview(logoImageView)
        addSubview(menuTitleLabel)
        addSubview(specialiteLabel)
        addSubview(timeLabel)
        
        
        // set constraints
        
        menuImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        menuImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        menuImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        menuImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        menuImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -80).isActive = true
        
        separatorLine.centerXAnchor.constraint(equalTo: menuImageView.centerXAnchor).isActive = true
        separatorLine.topAnchor.constraint(equalTo: menuImageView.bottomAnchor).isActive = true
        separatorLine.leftAnchor.constraint(equalTo: menuImageView.leftAnchor).isActive = true
        separatorLine.widthAnchor.constraint(equalTo: menuImageView.widthAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        logoImageView.leftAnchor.constraint(equalTo: menuImageView.leftAnchor, constant: 5).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logoImageView.topAnchor.constraint(equalTo: menuImageView.topAnchor, constant: 5).isActive = true
        
        
        
        menuTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        menuTitleLabel.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 5).isActive = true
        
        
        specialiteLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        specialiteLabel.topAnchor.constraint(equalTo: menuTitleLabel.bottomAnchor, constant: 2).isActive = true
        
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: specialiteLabel.bottomAnchor, constant: 2).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
