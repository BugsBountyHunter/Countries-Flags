//
//  MessageAlert.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/17/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
// make error show esay
extension UIViewController{
    
    func showAlert(title:String , message:String , okTitle:String? , completion:alertHandler?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: completion))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    func logoutAlert(title:String , message:String , okTitle:String? , completion:alertHandler?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: okTitle, style: .destructive, handler: completion))
        
        self.present(alert, animated: true, completion: nil)
    }
}
