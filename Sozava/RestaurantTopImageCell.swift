//
//  RestaurantTopImageCell.swift
//  Sozava
//
//  Created by Esso Awesso on 08/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class RestaurantTopImageCell: UICollectionViewCell {
    
    
    let backImage:  UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "riz-cantonnais")
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let logoImage:  UIImageView = {
        let iv = UIImageView()
        //iv.backgroundColor = UIColor.red
        iv.image = UIImage(named: "Hippo")
        iv.layer.cornerRadius = 25
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let hoursLabel: UILabel = {
       let lb = UILabel()
        lb.text = "10:00-18:45"
        lb.textColor = UIColor.white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let durationTextView: UILabel = {
       let lb = UILabel()
        lb.text = "45min"
        lb.textColor = UIColor.white
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = UIColor.purple
        return lb
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(backImage)
        addSubview(logoImage)
        addSubview(hoursLabel)
        addSubview(durationTextView)
        
        //set constraints

        logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        backImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        backImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        hoursLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hoursLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        hoursLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        hoursLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        durationTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        durationTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        durationTextView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        durationTextView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }

}
