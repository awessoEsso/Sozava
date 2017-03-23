//
//  MenusViewController.swift
//  Sozava
//
//  Created by Esso Awesso on 11/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit
import Firebase

class MenusViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    var restaurant = Restaurant(){
        didSet{
            navigationItem.title = restaurant.name
        }
    }
    
    
    let menuCellId = "menuCellId"
    
    let productsRef = FIRDatabase.database().reference().child("products")
    
    let categoriesRef = FIRDatabase.database().reference().child("categories")
    
    
    let menuDetailsLauncher = MenuDetailsLauncher()
    
    
    
    
    let header: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
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
    
    let categoriesBar = CategoriesBar()
    
    var productsList = [Produit]()
    
    var categoriesList  = [Categorie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView?.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        collectionView?.register(MenuCell.self, forCellWithReuseIdentifier: menuCellId)
        setupViews()
        
        menuDetailsLauncher.menuDetailView.quantity = 1
        
        observeProducts()
    }
    
    
    func observeProducts(){
        let req = productsRef.queryOrdered(byChild: "restaurant").queryEqual(toValue: restaurant.id)
        req.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any]{
                let produit = Produit()
                produit.id = snapshot.key
                produit.name = dictionary["name"] as! String?
                produit.desc = dictionary["description"] as! String?
                produit.price =  dictionary["price"] as! String?
                produit.restaurant = dictionary["restaurant"] as! String?
                produit.categorie = dictionary["category"] as! String?
                produit.imageUrl = dictionary["imageUrl"] as! String?
                self.productsList.append(produit)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        })
        
    }
    
    func setupViews(){
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as? MenuCell
        let produit = self.productsList[indexPath.row]
        cell?.menuTitleLabel.text = produit.name
        cell?.specialiteLabel.text = produit.desc
        
        cell?.timeLabel.text = "\(produit.price!) €"
        if let menuImageUrl = produit.imageUrl {
            cell?.menuImageView.loadImageUsingCacheWithUrlString(urlString: menuImageUrl)
        }
        return (cell)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 10), height: CGFloat(230))
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // show menu
        menuDetailsLauncher.showMenu()
    }
    
        
    
    
    
}

