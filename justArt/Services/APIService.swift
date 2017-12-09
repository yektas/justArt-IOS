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
                debugPrint("Got an error: \(response.result.error)")
            }
        }
    }
    
    func getArtists(completion: @escaping ([Artist]) -> Void) {
        
        var artists: [Artist] = []
        
        Alamofire.request(ARTISTS_URL).responseArray() { (response: DataResponse<[Artist]>) in
            if let artistArray = response.result.value{
                for artist in artistArray{
                    artists.append(artist)
                }
                completion(artists)
            } else {
                debugPrint("Got an error: \(response.result.error)")
            }
        }
    }
}









