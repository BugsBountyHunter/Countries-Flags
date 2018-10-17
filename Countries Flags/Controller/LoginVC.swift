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
      
    }
    //Function
    //Action
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        loginBtn.startAnimation()
        guard let email = emailTxtfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)  else{return}
        guard let pass = passwordTxtfield.text else{return}
        
        if email != "" && pass != "" {
            AuthService.instanc.loginUser(withEmail: email, andPassword: pass) { (status, error) in
                if status {
                    guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: HOME_VC) as? HomeVC else{return}
                    self.loginBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.5, completion: nil)
                    self.present(homeVC, animated: true, completion: nil)
                }else{
                    self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
                    self.showAlert(title: "Login Error Message", message:  (error?.localizedDescription)!, okTitle: "ok", completion: nil)
                }//if
            }
        }else{
            if email == "" {
                self.showAlert(title: "Login Error Message", message: "Please write correct email ", okTitle: "ok", completion: nil)
                self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }else if pass == "" {
                  self.showAlert(title: "Login Error Message", message: "Please write correct password ", okTitle: "ok", completion: nil)
                self.loginBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }
        }
        
    }
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        guard let createAccountVC = storyboard?.instantiateViewController(withIdentifier: CREATE_ACCOUNT_VC) as? CreateAccountVC else {
            return
        }
        present(createAccountVC, animated: true, completion: nil)
    }
    
}

