//
//  ViewController.swift
//  justArt
//
//  Created by Sercan Yektaş on 2.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import UIKit
import SCLAlertView

class GameVC: UIViewController {
    
    var timer = Timer()
    var timeLeft = TIMEOUT_VALUE
    var questions: [Question] = []
    var popedQuestions: [Question] = []
    var artists: [Artist] = []
    
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var questionNumberLbl: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet var choiceButtons: [RoundedButton]!
    
    //Set custom appearence for AlertView
    let appearance = SCLAlertView.SCLAppearance(
        showCloseButton: false
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderQuestion()
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameVC.mainLoop), userInfo: nil, repeats: true)
    }
    
    @objc func mainLoop(){
        if (timeLeft <= 0){
            timer.invalidate()
        } else {
            timeLeft -= 1
            timerLbl.text = String(timeLeft)
        }
    }
    
    @IBAction func choiceBtnPressed(sender: UIButton){
        timer.invalidate()
        let answer = sender.title(for: .normal)!
        handleAnswer(answer: answer, button: sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.resetUI()
            self.renderQuestion()
        })
    }
    
    func resetUI(){
        timeLeft = TIMEOUT_VALUE
        timerLbl.text = String(timeLeft)
        
        for choiceBtn in choiceButtons {
            choiceBtn.isEnabled = true
            choiceBtn.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        }
    }
    
    func renderQuestion(){
        runTimer()
        var choices: [String] = []
        var choiceCount = 0
        let currentQuestion = questions.popLast()
        if currentQuestion == nil {
            performSegue(withIdentifier: TO_ENDSCREEN, sender: nil)
        } else {
            popedQuestions.append(currentQuestion!)
            let answer = currentQuestion?.answer
            choices.append(answer!)
            
            // Change questionNumber Lbl
            questionNumberLbl.text = "\(String(popedQuestions.count))/\(TOTAL_QUESTIONS)"
            
            // Set choices
            for i in 0...artists.count {
                if (choiceCount < 3) {
                    if artists[i].name != answer {
                        choices.append(artists[i].name!)
                        choiceCount += 1
                    }
                } else {
                    break
                }
            }
            choices.shuffle()
            for (i, choiceBtn) in choiceButtons.enumerated(){
                choiceBtn.setTitle(choices[i], for: .normal)
            }
            // Set questionImage
            if let url = NSURL(string: (currentQuestion?.imageURL)!) {
                if let data = NSData(contentsOf: url as URL) {
                    self.questionImage.image = UIImage(data: data as Data)
                    self.questionImage.tag = (currentQuestion?.id)!
                }
            }
        }
        
    }
    
    func handleAnswer(answer: String, button: UIButton){
        timer.invalidate()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        let alertView = SCLAlertView(appearance: appearance)
        
        
        let questionID = self.questionImage.tag
        if let index = popedQuestions.index(where: { $0.id == questionID }) {
            for btn in choiceButtons {
                btn.isEnabled = false
            }
            if (popedQuestions[index].answer == answer){
                button.backgroundColor = #colorLiteral(red: 0.1155803427, green: 0.947989285, blue: 0.2324065864, alpha: 1)
                let questionPoint = popedQuestions[index].point
                let newPoint = Int(pointLbl.text!)! + questionPoint!
                pointLbl.text = String(newPoint)
                
                alertView.showSuccess("Doğru", subTitle: "",timeout:SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 1.2, timeoutAction:timeoutAction))
            } else {
                button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                alertView.showError("Yanlış", subTitle: "",timeout:SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 1.2, timeoutAction:timeoutAction))
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let endScreen = segue.destination as? EndScreenVC {
            endScreen.finalPoint = pointLbl.text!
        }
    }
    
}
