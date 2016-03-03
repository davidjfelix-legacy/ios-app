//
//  Ingredient.swift
//  Feasted
//
//  Created by Joshua Newkirk on 3/2/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import ObjectMapper

class Ingredient : Mappable
{
    var name: String?
    var description: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
    }
}