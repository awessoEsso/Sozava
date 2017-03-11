//
//  MenuBar.swift
//  Sozava
//
//  Created by Esso Awesso on 11/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class CategoriesBar : UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let categoryCellId = "menuCellId"
    
    let categoriesCollectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let categories = [Category]()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        categoriesCollectionview.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        categoriesCollectionview.delegate = self
        categoriesCollectionview.dataSource = self
        
        
        setupViews()
    }
    
    func setupViews(){
        addSubview(categoriesCollectionview)
        
        //constraints
        
        categoriesCollectionview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        categoriesCollectionview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        categoriesCollectionview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoriesCollectionview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: self.frame.height)
    }
}











