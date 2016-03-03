//
//  Token.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import ObjectMapper

class Token: Mappable
{
    var type : String?
    var text : String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        type <- map["type"]
        text <- map["text"]
    }
    
    func getToken() -> String {
        return "\(self.type) \(self.text)"
    }
}