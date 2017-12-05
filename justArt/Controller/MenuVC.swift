//
//  MenuVC.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CATEGORY, sender: nil)
    }

}
