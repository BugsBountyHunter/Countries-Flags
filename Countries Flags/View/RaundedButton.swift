//
//  RaundedButton.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
  
    @IBInspectable var cornerRadius : CGFloat =  3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setpView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setpView()
    }
    func setpView(){
        
        self.layer.cornerRadius  = cornerRadius
    }
}
