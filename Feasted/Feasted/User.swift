//
//  User.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import ObjectMapper

class User : Mappable
{
    var userId : String?
    var name : String?
    var email : String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        userId <- map["user_id"]
        name <- map["name"]
        email <- map["email"]
    }
}