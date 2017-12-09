//
//  MenuVC.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We get all the questions (with a specified limit in the constants)
        // and store it in the UserDefaults
        DataService.saveQuestionsToLocalData()
        DataService.saveArtistsToLocalData()
        
    }
    @IBAction func playBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CATEGORY, sender: nil)
    }

}
