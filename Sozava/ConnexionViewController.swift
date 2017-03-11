//
//  ConnexionViewController.swift
//  Sozava
//
//  Created by Esso Awesso on 28/02/2017.
//  Copyright © 2017 Esso Awesso. All rights reserved.
//

import UIKit

class ConnexionViewController: UIViewController {
    
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        return tf
    }()
    
    let pwdTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Mot de passe"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        return tf
    }()
    
    let emailSeparatorView : UIView = {
        let sp = UIView()
        sp.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    let pwdSeparatorView : UIView = {
        let sp = UIView()
        sp.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        sp.translatesAutoresizingMaskIntoConstraints = false
        return sp
    }()
    
    let forgottenPwdButton : UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.setTitle("Vous avez oublié votre mot de passe?", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = UIColor.blue
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    func setupComponents(){
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Connexion"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(handleOk))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
        
        let backImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        
        
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(emailSeparatorView)
        view.addSubview(pwdSeparatorView)
        view.addSubview(forgottenPwdButton)
        
        //set constraints x,y,w,h
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pwdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwdTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        pwdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        pwdTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        pwdTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailSeparatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailSeparatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        pwdSeparatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwdSeparatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        pwdSeparatorView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        pwdSeparatorView.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor).isActive = true
        pwdSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        forgottenPwdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forgottenPwdButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        forgottenPwdButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        forgottenPwdButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 10).isActive = true
        forgottenPwdButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        
    }
    
    
    func handleOk(){
        
    }
    
    func handleBack(){
        let connexionController = navigationController?.popViewController(animated: true)
        connexionController?.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

   

}
