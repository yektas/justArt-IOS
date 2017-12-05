//
//  RoundedButton.swift
//  justArt
//
//  Created by Sercan Yektaş on 3.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    override func prepareForInterfaceBuilder() {
        customiseButton()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customiseButton()
    }
    
    func customiseButton(){
        layer.cornerRadius = 10
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }

}
