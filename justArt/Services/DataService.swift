//
//  DataService.swift
//  justArt
//
//  Created by Sercan Yektaş on 6.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation

class DataService {
    
    static let userData = UserDefaults.standard
    
    class func saveQuestionsToLocalData() {
        var encodedQuestions: [Data] = []
        APIService.instance.getQuestions { (questions) in
            for question in questions{
                do {
                    encodedQuestions.append(Conversion.encodeObject(question: question) as! Data)
                }
            }
            userData.set(encodedQuestions, forKey: "questions")
        }
    }
    
    
    class func getQuestions(withCategory category: String) -> [Question] {
        var questions: [Question] = []
        let encodedQuestions = userData.object(forKey: "questions") as! [Data]
        for encodedQuestion in encodedQuestions{
            let question = Conversion.decodeObject(encodedObject: encodedQuestion)!
            for cat in question.category!{
                if cat.categoryName == category {
                    questions.append(question)
                    break
                }
            }
        }
        return questions
    }
}
