//
//  CategoryVC.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func categoryBtnPressed(_ sender: UIButton){
        self.category = String(sender.tag)
        performSegue(withIdentifier: TO_GAME, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameVC = segue.destination as? GameVC {
            gameVC.questions = DataService.getQuestions(withCategory: self.category)
            gameVC.artists = DataService.getArtists()
        }
    }
}
