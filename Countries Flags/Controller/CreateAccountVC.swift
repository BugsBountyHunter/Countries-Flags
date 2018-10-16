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
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
    }
    

}
