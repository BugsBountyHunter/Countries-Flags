//
//  DataService.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import Foundation
import Alamofire
import Gloss
class DataService {
    
    static let instanc = DataService()
    
    // request to server to get all Data from api
    func getCountriesData(api:String , completion:@escaping (_ dataArray:[Country]?,_ error:Error?)->()){
        var countryArray = [Country]()
        Alamofire.request(api).responseJSON {  (respons) in
            //respons
            if respons.result.error != nil {
                completion(nil , respons.result.error)
            }else{
            guard let data = respons.result.value as? [Dictionary<String,AnyObject>] else{return}
            //handle respons in model
            for country in data {
                guard let newCountry = Country.init(json: country) else {return}
                countryArray.append(newCountry)
            }
            completion(countryArray,nil)
                
            }//if
        }//clsure
    }
    
}
