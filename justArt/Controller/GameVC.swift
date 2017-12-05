//
//  ViewController.swift
//  justArt
//
//  Created by Sercan Yektaş on 2.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit
import Canvas

class GameVC: UIViewController {
    
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionImage: UIImageView!

    @IBOutlet var choiceButtons: [RoundedButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func choice1Pressed(_ sender: Any) {
 
    }
    @IBAction func choice2Pressed(_ sender: Any) {
    }
    @IBAction func choice3Pressed(_ sender: Any) {
    }
    @IBAction func choice4Pressed(_ sender: Any) {
    }
}
