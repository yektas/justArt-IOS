//
//  ViewController.swift
//  justArt
//
//  Created by Sercan Yektaş on 2.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    var questions: [Question] = []
    
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionImage: UIImageView!

    @IBOutlet var choiceButtons: [RoundedButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let q1 = self.questions[0]
//
//        choiceButtons[0].setTitle(q1.answer, for: .normal)
        
        
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
