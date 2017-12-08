//
//  Question.swift
//  justArt
//
//  Created by Sercan Yektaş on 3.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation
import ObjectMapper

class Question: Mappable, Codable {
    var id: Int?
    var imageURL: String?
    var answer: String?
    var point: Int?
    var category: [Category]?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        id <- map["id"]
        imageURL <- map["questionImage"]
        answer <- map["answer"]
        point <- map["point"]
        category <- map["category"]
    }
}

class Category: Mappable, Codable {
    var categoryName: String?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        categoryName <- map["category_name"]
    }
}

