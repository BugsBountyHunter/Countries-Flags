//
//  Constants.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit

//URLS
let API_URL = "https://restcountries.eu/rest/v2/all"

//Cell Identifire
 let COUNTRY_CELL = "countriesCell"

// VC Identifire
let LOGIN_VC = "loginVC"
let CREATE_ACCOUNT_VC = "createAccountVC"
let HOME_VC = "homeVC"

//segue Identifire
let FROM_REGISTER_HOME_VC = "toHomeVC"
let FROM_LOGIN_TO_CREATEACCOUNT_VC = "toCreateAccountVC"
let FROM_LOGIN_TO_HOME_VC = "logintoHomeVC"
let BACK_TO_LOGIN = "backToLogin"
//Completion Handler

typealias firebaseHandler = (_ status:Bool ,_ error:Error?)->()
typealias countryHandler = (_ status:Bool)->()
typealias alertHandler  = (_ okHandler:UIAlertAction)->()
