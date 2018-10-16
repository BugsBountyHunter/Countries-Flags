//
//  AuthService.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import Foundation
import Firebase
class AuthService {
    static let instanc = AuthService()
    
    //this methode help user to register new account in firebase by email and password
    func registerUser(withEmail email:String ,andPassword password:String ,completion:@escaping firebaseHandler){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
            completion(false,error)
            }else{
                completion(true, nil)
            }
        }
    }
    
    //this methode help user to login firebase by own email and password
    
    func loginUser(withEmail email:String ,andPassword password:String , completion:@escaping firebaseHandler){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(false,error)
            }else{
                completion(true, nil)
            }
        }
    }
    
}
