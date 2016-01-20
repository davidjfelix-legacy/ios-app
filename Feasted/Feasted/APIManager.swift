//
//  APIManager.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/20/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation

class APIManager: NSObject {
    
    // private vars
    private(set) var isProduction : Bool
    
    // public static strings
    static let SERVER : String = "http://api.davidjfelix.com"
    static let STAGE_SERVER : String = "https://unknown"
    
    override init() {
        // no arg
        self.isProduction = false
    }
    
    func serviceEndpoint() -> String {
        return isProduction ? APIManager.SERVER : APIManager.STAGE_SERVER
    }
}