//
//  CreateAccountVC.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import TransitionButton
class CreateAccountVC: UIViewController {
    //Outlets
    @IBOutlet weak var emailTxtfield: CustomTextField!
    @IBOutlet weak var passwordTxtfield: CustomTextField!
    @IBOutlet weak var confirmPassTxtfield: CustomTextField!
    @IBOutlet weak var createAccountBtn: TransitionButton!
    
    //Variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add Gusture to view
        let tapGusture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGusture)
    }
    //function
    @objc func dismissKeyboard(){
        emailTxtfield.endEditing(true)
        passwordTxtfield.endEditing(true)
        confirmPassTxtfield.endEditing(true)
    }
    //Acrion
    @IBAction func createAccountBtnWasPressed(_ sender: Any) {
         createAccountBtn.startAnimation()
        guard let email = emailTxtfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let pass = passwordTxtfield.text else{return}
        guard let confirmPass = confirmPassTxtfield.text else{return}
        
        if  !email.isEmpty && pass == confirmPass{
            AuthService.instanc.registerUser(withEmail: email, andPassword: pass) { (status , error ) in
                if status {
                    self.createAccountBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1.0, completion: nil)
                    self.performSegue(withIdentifier: FROM_REGISTER_HOME_VC, sender: self)
                }else{
                    self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
                    self.showAlert(title: " Register Error Message ", message:  (error?.localizedDescription)!, okTitle: "ok", completion: nil)
                }//if
            }
        }else{
            if email.isEmpty {
                self.showAlert(title: "Register Error Message", message: "Please Fill all Data ", okTitle: "ok", completion: nil)
                self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }else if pass != confirmPass {
                self.showAlert(title: "Register Error Message", message: "Password not match", okTitle: "ok", completion: nil)
                self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }
            
        }//if
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
       performSegue(withIdentifier: BACK_TO_LOGIN, sender: self)
    }
    

}
