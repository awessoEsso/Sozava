//
//  MenuDetailsView.swift
//  Sozava
//
//  Created by Esso Awesso on 18/03/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class MenuDetailsView: UIView {
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "noura")
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let closeBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let menuNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Petit Déjeuner Anglais"
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "20.00 €"
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "The English Breakfast! Au programme : Boisson, pain Anglais, oeufs brouillés, patisserie anglo saxone et tartinable"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addCommentField : UITextField = {
       let tf = UITextField()
        tf.placeholder = "Ajouter un commentaire"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let commentFieldIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tfIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let numberOfItemsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "1"
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    var quantity : Int? {
        didSet{
            self.numberOfItemsLabel.text = "\(quantity!)"
        }
    }
    
    let separatorLine : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let redView: UIView = {
        let rd = UIView()
        rd.translatesAutoresizingMaskIntoConstraints = false
        rd.backgroundColor = UIColor(red: 217/255, green: 15/255, blue: 92/255, alpha: 1)
        return rd
    }()
    
    
    let decrementButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "minus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleDecrement), for: .touchUpInside)
        return btn
    }()
    
    let verticalSeparator : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.white
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
   
    
    let incrementButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleIncrement), for: .touchUpInside)
        return btn
    }()
    
    let addToBucketButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Ajouter au panier", for: .normal)
        btn.addTarget(self, action: #selector(handleAddToBucket), for: .touchUpInside)
        return btn
    }()
    
    
    override init(frame : CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    func handleDecrement(){
        
        if self.quantity! > 1 {
            self.quantity = self.quantity! - 1
        }
        
    }
    
    func handleAddToBucket(){
        print("Added to bucked")
    }
    
    func handleIncrement(){
        self.quantity = self.quantity! + 1
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(imageView)
        addSubview(closeBtn)
        addSubview(menuNameLabel)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        addSubview(separatorLine)
        
        
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        closeBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        menuNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        menuNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        menuNameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        menuNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 8).isActive = true
        
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorLine.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8).isActive = true
        
        
        let fieldView = UIView()
        addSubview(fieldView)
        fieldView.translatesAutoresizingMaskIntoConstraints = false
        fieldView.addSubview(commentFieldIcon)
        fieldView.addSubview(addCommentField)
        
        fieldView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        fieldView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fieldView.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 3).isActive = true
        
        commentFieldIcon.leftAnchor.constraint(equalTo: fieldView.leftAnchor, constant: 5).isActive = true
        commentFieldIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        commentFieldIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentFieldIcon.centerYAnchor.constraint(equalTo: fieldView.centerYAnchor).isActive = true

        
        addCommentField.leftAnchor.constraint(equalTo: commentFieldIcon.rightAnchor, constant: 5).isActive = true
        addCommentField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        addCommentField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addCommentField.centerYAnchor.constraint(equalTo: fieldView.centerYAnchor).isActive = true
        
        
        
        addSubview(redView)
        
        redView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        redView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        redView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        redView.addSubview(decrementButton)
        redView.addSubview(numberOfItemsLabel)
        redView.addSubview(incrementButton)
        redView.addSubview(verticalSeparator)
        redView.addSubview(addToBucketButton)
        
        
        
        decrementButton.leftAnchor.constraint(equalTo: redView.leftAnchor, constant: 8).isActive = true
        decrementButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        decrementButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        decrementButton.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        
        numberOfItemsLabel.leftAnchor.constraint(equalTo: decrementButton.leftAnchor, constant: 20).isActive = true
        numberOfItemsLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        numberOfItemsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberOfItemsLabel.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        
        incrementButton.leftAnchor.constraint(equalTo: decrementButton.rightAnchor, constant: 20).isActive = true
        incrementButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        incrementButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        incrementButton.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        
        verticalSeparator.leftAnchor.constraint(equalTo: incrementButton.rightAnchor, constant: 20).isActive = true
        verticalSeparator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        verticalSeparator.heightAnchor.constraint(equalToConstant: 30).isActive = true
        verticalSeparator.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        
        
        addToBucketButton.rightAnchor.constraint(equalTo: redView.rightAnchor, constant: -20).isActive = true
        addToBucketButton.leftAnchor.constraint(equalTo: incrementButton.rightAnchor, constant: 40).isActive = true
        addToBucketButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addToBucketButton.centerYAnchor.constraint(equalTo: redView.centerYAnchor).isActive = true
        
    }
    
    
    
    func estimateFrameForText(text: String) -> CGRect{
        let size = CGSize(width: self.frame.width, height: 1500)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12)], context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
