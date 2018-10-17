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

//Completion Handler

typealias firebaseHandler = (_ status:Bool ,_ error:Error?)->()
typealias countryHandler = (_ status:Bool)->()
typealias alertHandler  = (_ okHandler:UIAlertAction)->()
