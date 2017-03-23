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
    
    lazy var categoriesCollectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let horizontalBarView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    let bottomSeparator: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()

    
    var categoriesList = [Categorie]()
    
    var barItemsRightValues = [CGFloat]()
    
    var barLeftAnchorConstaint: NSLayoutConstraint?
    var barWidthAnchorConstraint: NSLayoutConstraint?
    var barRightAnchorConstraint: NSLayoutConstraint?
    
    
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        categoriesCollectionview.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        
        
        
        setupViews()
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(categoriesCollectionview)
        addSubview(bottomSeparator)
        addSubview(horizontalBarView)
        
        //constraints
        
        categoriesCollectionview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        categoriesCollectionview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        categoriesCollectionview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoriesCollectionview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        bottomSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomSeparator.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        barLeftAnchorConstaint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        barLeftAnchorConstaint?.isActive = true
        barWidthAnchorConstraint = horizontalBarView.widthAnchor.constraint(equalToConstant: 60)
        barWidthAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        print(barItemsRightValues)
        
    }
    
    func estimateFrameForText(text: String) -> CGRect{
        let size = CGSize(width: 1500, height: 60)
        
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCell
        cell.categorie = self.categoriesList[indexPath.row]
        cell.backgroundColor = UIColor.white
        //cell.cellWidthAnchor?.constant = estimateFrameForText(text: cell.categorie.name!).width + 20
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // size updated here
        
        var width: CGFloat = 60
        var cgRect = CGRect()
        
        if let text = categoriesList[indexPath.row].name {
            cgRect = estimateFrameForText(text: text)
            width = cgRect.width + 20
        }
        
        if indexPath.item == 0 {
            barItemsRightValues.append(width)
        }
        else
        {
            barItemsRightValues.append(barItemsRightValues[indexPath.item - 1] + width)
        }
        
        return CGSize(width: width, height: self.frame.height)

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath)  as! CategoryCell
        print(cell.frame)
        
        horizontalBarView.frame = CGRect(x: barItemsRightValues[indexPath.item - 1], y: 50, width: barItemsRightValues[indexPath.item] - barItemsRightValues[indexPath.item - 1], height: 4)
        
    }
    
}











