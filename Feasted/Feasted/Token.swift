//
//  Token.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation

class Token: NSObject {
    
    var type : String
    var text : String
    
    override init() {
        // no arg constructor
        type = ""
        text = ""
    }
    
    func getToken() -> String {
        return "\(self.type) \(self.text)"
    }
}