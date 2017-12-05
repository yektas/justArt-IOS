//
//  RoundedImage.swift
//  justArt
//
//  Created by Sercan Yektaş on 3.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImage: UIImageView {
    
    override func prepareForInterfaceBuilder() {
        customizeImage()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeImage()
    }
    
    func customizeImage(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
