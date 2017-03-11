//
//  LoginViewController.swift
//  Sozava
//
//  Created by Esso Awesso on 27/02/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let connexionButton : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Connexion", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.tintColor = UIColor.black
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    let alreadyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Vous avez déjà un compte?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    let facebookConnect : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor.blue
        button.tintColor = UIColor.white
        button.setTitle("Connexion avec Facebook", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let inscriptionButton : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor.white
        button.setTitle("S'inscrire", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.tintColor = UIColor.black
        return button
    }()
    
    let backgroundImage : UIImageView = {
        let bgImageView = UIImageView(image: UIImage(named: "bg"))
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        return bgImageView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        let crossImage = UIImage(named: "cross")!.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: crossImage, style: .plain, target: self, action: #selector(handleCross))
        
        navigationItem.title = "Connexion"
        
        
        setupComponents()
        
        connexionButton.addTarget(self, action: #selector(goToConnect), for: UIControlEvents.touchUpInside)
        
    }
    
    func handleCross(){
        let lgController = navigationController?.popViewController(animated: true)
        lgController?.dismiss(animated: true, completion: nil)
    }
    
    func goToConnect(){
        let connexionViewController = ConnexionViewController()
        navigationController?.pushViewController(connexionViewController, animated: true)
        //dismiss(animated: true, completion: nil)
    }
    
    func setupComponents(){
        
        view.addSubview(facebookConnect)
        view.addSubview(inscriptionButton)
        view.addSubview(backgroundImage)
        view.addSubview(connexionButton)
        view.addSubview(alreadyButton)

        
        // set FacebookButton Constraints x,y, width, height
        
        facebookConnect.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        facebookConnect.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        facebookConnect.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookConnect.bottomAnchor.constraint(equalTo: inscriptionButton.topAnchor).isActive = true
        
        
        inscriptionButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        inscriptionButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        inscriptionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        inscriptionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: facebookConnect.topAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        connexionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        connexionButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        connexionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        connexionButton.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -15).isActive = true
        
        
        alreadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alreadyButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        alreadyButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
        alreadyButton.bottomAnchor.constraint(equalTo: connexionButton.topAnchor, constant: -15).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}
