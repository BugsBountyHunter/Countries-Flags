//
//  DataService.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import Foundation
import Alamofire
class DataService {
    
    static let instanc = DataService()
    
    //Variabel
    var countryArray = [Country]()
    
    //this function get all Data from API
    func getCcountriesData(withApiurl apiUrl:String , completion:@escaping firebaseHandler){
        Alamofire.request(apiUrl).responseJSON { (respons) in
            
            if respons.result.error != nil{
                completion(false,respons.result.error)
            }else{
                guard let json = respons.result.value as? [Dictionary<String,AnyObject>] else{return}
                //loop in json array
                for data in json {
                    guard let countryName = data["name"] as? String else{return}
                    guard let capitalName = data["capital"] as? String else{return}
                    //get timeZone from api
                    guard let time = data["timezones"] as? [String] else{return}
                    let timeZone = time[0]
                    //get countrycode to add flagUrl
                    guard let alphaCode = data["alpha2Code"] as? String else{return}
                    let countryCode = alphaCode.lowercased()
                    //create url for download country image flag from site : https://countryflags.io/
                    let flagUrl = "https://www.countryflags.io/\(countryCode)/shiny/64.png"
                    //create new custom type of Array by using country model 
                    let newCountry = Country.init(countryName: countryName, capitalName: capitalName, timeZone: timeZone, imageUrl: flagUrl)
                    self.countryArray.append(newCountry)
                }//loop
                completion(true,nil)
            }//if
        }//closure
    }
    
}
