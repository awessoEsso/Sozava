//
//  CategoryCell.swift
//  Sozava
//
//  Created by Esso Awesso on 09/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "Plats"
        l.textColor = UIColor.black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    

    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(label)
        
        //constraints
        
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}




