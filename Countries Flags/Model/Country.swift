//
//  Country.swift
//  Countries Api
//
//  Created by AHMED SR on 10/14/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import Foundation
import Gloss
struct Country {
        let countryName:String?
        let capitalName:String?
        let timeZone:String?
        let imageUrl:String?
        let region :String?
    
    init?(json: JSON) {
        
        //get countrycode to add to URl
        guard let countryCode:String = "alpha2Code" <~~ json else{return nil }
        let countryLowrcase = countryCode.lowercased()
        //get timeZone
        guard  let time:[String] = "timezones" <~~ json  else {return nil}
        let timeZone:String = time[0]

        self.countryName = "name" <~~ json
        self.capitalName = "capital" <~~ json
        self.timeZone = "\(timeZone)"
        self.imageUrl = "https://www.countryflags.io/\(countryLowrcase)/shiny/64.png"
        self.region = "region" <~~ json
    }
}

