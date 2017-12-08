//
//  Serialization.swift
//  justArt
//
//  Created by Sercan Yektaş on 9.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation

class Conversion {
    
    class func encodeObject(question: Question) -> Data?{
        do {
            let encodedQuestion = try JSONEncoder().encode(question)
            return encodedQuestion
        } catch {
            debugPrint("Could not encode the question")
        }
        return nil
    }
    
    class func stringToUrlData(path: String) -> Data? {
        if let url = NSURL(string: path) {
            if let data = NSData(contentsOf: url as URL) {
                return data as Data
            }
        }
        return nil
    }
    
    class func decodeObject(encodedObject: Data) -> Question?{
        let data = encodedObject
        do{
            let decodedObject = try JSONDecoder().decode(Question.self, from: data)
            return decodedObject as! Question
        } catch {
            debugPrint("Could not decode the data")
        }
        return nil
    }
}
