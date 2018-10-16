//
//  GradientView.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

@IBDesignable

class GradientView: UIView {

    @IBInspectable var topColor:UIColor = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 1)  {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var buttomColor:UIColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
  
    
    override func layoutSubviews() {
        //
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor , buttomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
