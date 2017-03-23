//
//  TestAnimationView.swift
//  Sozava
//
//  Created by Esso Awesso on 13/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

let offset_HeaderStop:CGFloat = 40.0 // At this offset the Header stops its transformations
let offset_B_LabelHeader:CGFloat = 95.0 // At this offset the Black label reaches the Header
let distance_W_LabelHeader:CGFloat = 35.0 // The distance between the bottom of the Header and the top of the White Label


class TestAnimationViewController: UIViewController, UIScrollViewDelegate {
    
    let header : UIView = {
       let v = UIView()
        v.backgroundColor = .red
        return v
    }()
    
    let headerImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "header_bg")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let headerLabel : UILabel = {
        let l = UILabel()
        l.text = "Jane Stormtrooper"
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let scrollView : UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let avatarImage : UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profile")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10.0
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3.0
        return iv
    }()
    
    let usernameLabel : UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "@zorobabel"
        return l
    }()
    
    
    let nameLabel : UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Jane Stormtrooper"
        return l
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        scrollView.delegate = self
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(header)
        view.addSubview(scrollView)
        
        header.addSubview(headerLabel)
        header.insertSubview(headerImageView, belowSubview: headerLabel)
        
        
        scrollView.addSubview(avatarImage)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(usernameLabel)
        
        
        //header constraints
        
        header.frame = CGRect(x: 0, y: 0, width: 375, height: 107)
        header.clipsToBounds = true
        
        headerImageView.frame = header.bounds
        
        
        headerLabel.centerXAnchor.constraint(equalTo: headerImageView.centerXAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerImageView.centerYAnchor).isActive = true
        headerLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

        //Scrollview
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Avatar Image
        
        //avatarImage.frame = CGRect(x: 8, y: 79, width: 69, height: 69)
        
        avatarImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 8).isActive = true
        avatarImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 79).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 69).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 69).isActive = true
        
        
        nameLabel.leftAnchor.constraint(equalTo: avatarImage.leftAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 5).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        usernameLabel.leftAnchor.constraint(equalTo: avatarImage.leftAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        scrollView.contentSize = CGSize(width: 375, height: 1500)
        
        
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
        
        
        if offset < 0 {
            
            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            header.layer.transform = headerTransform
        }
            
            
        else {
            
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
            
            
            let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
            headerLabel.layer.transform = labelTransform
            
            let avatarScaleFactor = (min(offset_HeaderStop, offset)) / avatarImage.bounds.height / 1.4 // Slow down the animation
            let avatarSizeVariation = ((avatarImage.bounds.height * (1.0 + avatarScaleFactor)) - avatarImage.bounds.height) / 2.0
            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
            
            if offset <= offset_HeaderStop {
                
                if avatarImage.layer.zPosition < header.layer.zPosition{
                    header.layer.zPosition = 0
                }
                
            }else {
                if avatarImage.layer.zPosition >= header.layer.zPosition{
                    header.layer.zPosition = 2
                }
            }
        }
        
        // Apply Transformations
        
        header.layer.transform = headerTransform
        avatarImage.layer.transform = avatarTransform
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
