//
//  CategoryVC.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func categoryBtnPressed(_ sender: UIButton){
        performSegue(withIdentifier: TO_GAME, sender: nil)
    }
    
    func getQuestions(by category: String){
        APIService.instance.getQuestionsByCategory(category: category) { (questionData) in
            for item in questionData{
                self.questions.append(item)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameVC = segue.destination as? GameVC {
            print(self.questions)
            //let url = URL(string: (questions.imageURL)!)
            //print(url)
            //let data = NSData(contentsOf: url!)
            //gameVC.questionImage.image = UIImage(data: data as! Data)
        }
    }
}

extension MutableCollection {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: numericCast(arc4random_uniform(numericCast(diff))))
            swapAt(i, j)
        }
    }
}
