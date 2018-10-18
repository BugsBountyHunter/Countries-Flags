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
    func getCountriesData(api:String , completion:@escaping (_ json:[JSON])->()){
        Alamofire.request(api).responseJSON { (respons) in
            //respons
            guard let data = respons.result.value as? [Dictionary<String,AnyObject>] else{return}
            completion(data)
        }
    }
    
}
