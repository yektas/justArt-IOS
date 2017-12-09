//
//  Artist.swift
//  justArt
//
//  Created by Sercan Yektaş on 9.12.2017.
//  Copyright © 2017 Sercan Yektaş. All rights reserved.
//

import Foundation
import ObjectMapper

class Artist: Mappable, Codable {
    
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["artist_name"]
    }
}
