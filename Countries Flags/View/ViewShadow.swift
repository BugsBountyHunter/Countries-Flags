//
//  ViewShadow.swift
//  Countries Flags
//
//  Created by AHMED SR on 10/16/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
@IBDesignable
class ViewShadow: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        self.layer.shadowOpacity = 0.85  // %75
        self.layer.shadowRadius = 10
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2431372549, blue: 0.462745098, alpha: 0.5)
        self.layer.opacity = 0.75
    }
}
