//
//  CountriesCell.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/14/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import Kingfisher
class CountriesCell: UITableViewCell {
    //TODO:Outlets
   
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    @IBOutlet weak var timeZone: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var regionName: UILabel!
    
    func configureCell(country:Country){
        countryNameLbl.text = country.countryName
        capitalLbl.text = country.capitalName
        timeZone.text = country.timeZone
        regionName.text = country.region
        
        //Download flag image cache it by kingfisher
        let url = URL(string: country.imageUrl!)!
//        let image = ImageResource(downloadURL: url, cacheKey: country.imageUrl)
        let image = ImageResource(downloadURL: url)
        flagImage.kf.setImage(with: image)
        
        //Another way to download image and view it in imageView
        
        //        DispatchQueue.global().async {
        //            let url = URL(string: country.imageUrl)!
        //            let data = try! Data(contentsOf: url)
        //            DispatchQueue.main.async {
        //                self.flagImage.image = UIImage(data: data)
        //            }
        //        }

    }
}
