//
//  MenusViewController.swift
//  Sozava
//
//  Created by Esso Awesso on 11/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class MenusViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let menuCellId = "menuCellId"
    
    var restaurant = Restaurant(){
        didSet{
            navigationItem.title = restaurant.name
        }
    }
    
    let categoriesBar = CategoriesBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: menuCellId)
        
        
        setupViews()
        
    }
    
    func setupViews(){        
        view.addSubview(categoriesBar)

        //constraints
        
        
        collectionView?.contentInset = UIEdgeInsets(top: 60, left: 5, bottom: 5, right: 5)
        //collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(60, 0, 0, 0)
        
        categoriesBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoriesBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoriesBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        categoriesBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 177.5, height: CGFloat(230))
    }
    
}

