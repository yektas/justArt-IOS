//
//  APIService.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    static let instance = APIService()
    
    
    func getQuestionsByCategory(category: String, completion: @escaping ([Question]) -> Void) {
        
        var questionArray: [Question] = []
        let parameters = ["limit": TOTAL_QUESTIONS, "category": category] as [String : Any]
        
        Alamofire.request(QUESTIONS_URL, parameters: parameters).responseJSON { (response) in
            
            if let value = response.result.value {
                let json = JSON(value)
                let results = json["results"]
                for (index, _) in results.enumerated(){
                    let id = results[index]["id"].intValue
                    let answer = results[index]["answer"].stringValue
                    let questionImage = results[index]["questionImage"].stringValue
                    let point = results[index]["point"].intValue
                    let category = results[index]["category"]["category_name"].stringValue
                    questionArray.append(Question(id: id, imageURL: questionImage, point: point, category: category, answer: answer))
                    completion(questionArray)
                }
            } else {
                debugPrint("Got an error: \(response.result.error) ")
                
                
            }
          
        }
       
        
    }
}







