//
//  AuthManager.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation

class AuthManager: NSObject
{
    // Private vars
    private var defaults : NSUserDefaults
    
    // Public static strings
    let BEARER_TOKEN : String = "bearer_token"
    
    // Public vars
    var activeUser : User?
    
    override init() {
        self.defaults = NSUserDefaults.standardUserDefaults()
        activeUser = nil
    }
    
    func saveBearerToken(bearerToken : String) {
        let token : String = "Bearer \(bearerToken)"
        self.defaults.setObject(token, forKey: BEARER_TOKEN)
        self.defaults.synchronize()
    }
    
    func getBearerToken() -> String {
        return self.defaults.stringForKey(BEARER_TOKEN)!
    }
    
    func unauthenticateUser() {
        activeUser = nil
        self.defaults.removeObjectForKey(BEARER_TOKEN)
        self.defaults.synchronize()
    }
}
