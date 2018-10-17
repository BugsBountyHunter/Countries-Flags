//
//  HomeVC.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import Firebase
class HomeVC: UIViewController {
    //Outlets
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //Action
    @IBAction func logoutBtnWasPressed(_ sender: Any) {
        logoutAlert(title: "Logout Message ", message: "Are you want to logout from Countries Flags ?", okTitle: "LOGOUT") { (action) in
            do{
                try Auth.auth().signOut()
                guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: LOGIN_VC) as? LoginVC else{return }
                self.present(loginVC, animated: true, completion: nil)
            }catch{
                self.showAlert(title: "Error logout message", message: "\(error.localizedDescription)", okTitle: "ok ", completion: nil)
            }
        }
    }
    
    
}
