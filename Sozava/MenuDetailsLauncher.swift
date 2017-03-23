//
//  MenuDetailsLauncher.swift
//  Sozava
//
//  Created by Esso Awesso on 18/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class MenuDetailsLauncher: NSObject {
    
    override init(){
        super.init()
        
        //
    }
    
    let blackView = UIView()
    
    let menuDetailView = MenuDetailsView()
    
    func showMenu(){
        if let window = UIApplication.shared.keyWindow{
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(menuDetailView)
            
            menuDetailView.closeBtn.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            
            let x: CGFloat = 20
            let y: CGFloat = 35
            
            menuDetailView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width - 2 * x, height: window.frame.height - 2 * y)
            menuDetailView.layer.cornerRadius = 5
            menuDetailView.clipsToBounds = true
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.menuDetailView.frame = CGRect(x: x, y: y, width: self.menuDetailView.frame.width, height: self.menuDetailView.frame.height)
            }, completion: nil)
            
            
        }
    }
    
    func handleDismiss(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
             if let window = UIApplication.shared.keyWindow{
                self.menuDetailView.frame = CGRect(x: 0, y: window.frame.height, width: self.menuDetailView.frame.width, height: self.menuDetailView.frame.height)
            }
        }
    }
    
    
    
    
    

}
