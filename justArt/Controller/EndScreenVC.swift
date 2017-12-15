//
//  EndScreenVC.swift
//  justArt
//
//  Created by Sercan Yektaş on 15.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class EndScreenVC: UIViewController {
    var finalPoint: String = ""
    
    @IBOutlet weak var pointLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointLbl.text = finalPoint
    }

}
