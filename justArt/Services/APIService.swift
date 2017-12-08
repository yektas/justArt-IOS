//
//  APIService.swift
//  justArt
//
//  Created by Sercan Yektaş on 5.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class APIService {
    
    static let instance = APIService()
    
    func getQuestions(completion: @escaping ([Question]) -> Void) {
        var questions: [Question] = []
        let parameters = ["limit": TOTAL_QUESTIONS]
        
        Alamofire.request(QUESTIONS_URL, parameters: parameters).responseArray(keyPath: "results") { (response: DataResponse<[Question]>) in
            
            if let questionArray = response.result.value{
                for q in questionArray{
                    questions.append(q)
                }
                completion(questions)
            } else {
                debugPrint("Got an error Bruhh: \(response.result.error)")
            }
        }
    }
}




//        Alamofire.request(QUESTIONS_URL, parameters: parameters).responseJSON { (response) in
//            if let value = response.result.value{
//                let json = JSON(value)
//                let results = json["results"]
//                for (index, _) in results.enumerated(){
//                    let id = results[index]["id"].intValue
//                    let answer = results[index]["answer"].stringValue
//                    let imageURL = results[index]["questionImage"].stringValue
//                    let point = results[index]["point"].intValue
//                    let category = results[index]["category"].arrayObject as! [Category]
//                    questionArray.append(Question(id: id, answer: answer, imageURL: imageURL, point: point, category: category))
//                    completion(questionArray)
//                }
//            } else {
//                debugPrint("Got an error: \(response.result.error) ")
//            }
//        }









