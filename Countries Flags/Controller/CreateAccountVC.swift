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

    }
    //function
    
    //Acrion
    @IBAction func createAccountBtnWasPressed(_ sender: Any) {
         createAccountBtn.startAnimation()
        guard let email = emailTxtfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let pass = passwordTxtfield.text else{return}
        guard let confirmPass = confirmPassTxtfield.text else{return}
        
        if  email != "" && pass == confirmPass{
            AuthService.instanc.registerUser(withEmail: email, andPassword: pass) { (status , error ) in
                if status {
                    guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: HOME_VC) as? HomeVC else{return}
                    self.createAccountBtn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1.0, completion: nil)
                    self.present(homeVC, animated: true, completion: nil)
                }else{
                    self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
                    self.showAlert(title: " Register Error Message ", message:  (error?.localizedDescription)!, okTitle: "ok", completion: nil)
                }//if
            }
        }else{
            if email == "" {
                self.showAlert(title: "Register Error Message", message: "Please Fill all Data ", okTitle: "ok", completion: nil)
                self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }else if pass != confirmPass {
                self.showAlert(title: "Register Error Message", message: "Password not match", okTitle: "ok", completion: nil)
                self.createAccountBtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.1, completion: nil)
            }
            
        }//if
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
