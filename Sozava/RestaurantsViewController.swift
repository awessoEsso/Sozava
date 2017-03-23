//
//  ViewController.swift
//  Sozava
//
//  Created by Esso Awesso on 27/02/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit
import Firebase

class RestaurantsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let restaurantsRef = FIRDatabase.database().reference().child("restaurants")
    
    
    
    var restaurantsList = Array<Restaurant>()
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Sozava"

        let profileImage = UIImage(named: "male")!.withRenderingMode(.alwaysOriginal)
        
        let searchImage = UIImage(named: "search")!.withRenderingMode(.alwaysOriginal)
        
        let leftBarButton = UIBarButtonItem(image: profileImage, style: .plain , target: self, action: #selector(handleProfile))
        
        let searchBarButton = UIBarButtonItem(image: searchImage, style: .plain , target: self, action: #selector(handleSearch))
        
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = searchBarButton
        
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        self.collectionViewLayout.collectionView?.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        collectionView?.register(RestaurantCell.self, forCellWithReuseIdentifier: cellId)
        
        observeRestaurants()
    }
    
    func handleProfile(){
        let loginController = LoginViewController()
        navigationController?.pushViewController(loginController, animated: true)
    }
    
    func handleSearch(){
        
    }
    
    func observeRestaurants(){
        restaurantsRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any]{
                let restaurant = Restaurant()
                restaurant.id = snapshot.key
                restaurant.setValuesForKeys(dictionary)
                self.restaurantsList.append(restaurant)
            }
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        })
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.restaurantsList.count
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? RestaurantCell
        let restaurant = self.restaurantsList[indexPath.row]
        
        cell?.menuTitleLabel.text = restaurant.name
        cell?.specialiteLabel.text = restaurant.specialite
        if let menuImageUrl = restaurant.imageUrl {
            cell?.menuImageView.loadImageUsingCacheWithUrlString(urlString: menuImageUrl)
        }
        if let logoImageUrl = restaurant.logoUrl {
            cell?.logoImageView.loadImageUsingCacheWithUrlString(urlString: logoImageUrl)
        }
        return (cell)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 10), height: CGFloat(230))
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restaurant = self.restaurantsList[indexPath.row]
        showMenusViewForRestaurant(restaurant: restaurant)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showMenusViewForRestaurant(restaurant: Restaurant){
        let menusViewController = MenusViewController(collectionViewLayout: UICollectionViewFlowLayout())
         menusViewController.restaurant = restaurant
        navigationController?.pushViewController(menusViewController, animated: true)
//

        
    }

 
}

