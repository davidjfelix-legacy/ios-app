//
//  Allergen.swift
//  Feasted
//
//  Created by Joshua Newkirk on 3/2/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import ObjectMapper

class Allergen : Mappable
{
    var allergenId: String?
    var name: String?
    var description: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        allergenId <- map["allergen_id"]
        name <- map["name"]
        description <- map["description"]
    }
}