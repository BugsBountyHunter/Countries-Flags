//
//  ViewController.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import TransitionButton
class LoginVC: UIViewController {
   //Outlets
    @IBOutlet weak var emailTxtfield: CustomTextField!
    @IBOutlet weak var passwordTxtfield: CustomTextField!
    @IBOutlet weak var loginBtn: TransitionButton!
    
    //Variable
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add Gusture to view
        let tapGusture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGusture)
    }
    //Function
    @objc func dismissKeyboard(){
//        emailTxtfield.endEditing(true)
//        passwordTxtfield.endEditing(true)
        view.endEditing(true)
    }
    //Action
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        loginBtn.startAnimation()
        guard let email = emailTxtfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)  else{return}
        guard let pass = passwordTxtfield.text else{return}
        
        if !email.isEmpty && !pass.isEmpty {
            AuthService.instanc.loginUser(withEmail: email, andPassword: pass) { (status, error) in
                if status {
                    self.loginBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1.0, completion: nil)
                    self.performSegue(withIdentifier: FROM_LOGIN_TO_HOME_VC, sender: self)
                }else{
                    self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
                    self.showAlert(title: "Login Error Message", message:  (error?.localizedDescription)!, okTitle: "ok", completion: nil)
                    
                }//if
            }
        }else{
            if email.isEmpty {
                self.showAlert(title: "Login Error Message", message: "Please write correct email ", okTitle: "ok", completion: nil)
                self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }else if pass.isEmpty {
                  self.showAlert(title: "Login Error Message", message: "Please write correct password ", okTitle: "ok", completion: nil)
                self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }
        }//if 
        
    }
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        //go to create new account page
      performSegue(withIdentifier: FROM_LOGIN_TO_CREATEACCOUNT_VC , sender: self)
    }
    
}

