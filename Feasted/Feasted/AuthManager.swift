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
    
    // Public static strings
    let BEARER_TOKEN : String = "bearer_token"
    
    // Public vars
    var activeUser : User?
    
    override init()
    {
        activeUser = nil
    }
    
    func saveBearerToken(bearerToken : String)
    {
        let token : String = "Bearer \(bearerToken)"
        NSUserDefaults.standardUserDefaults().setObject(token, forKey: BEARER_TOKEN)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func getBearerToken() -> String?
    {
        return NSUserDefaults.standardUserDefaults().stringForKey(BEARER_TOKEN)
    }
    
    func unauthenticateUser()
    {
        activeUser = nil
        NSUserDefaults.standardUserDefaults().removeObjectForKey(BEARER_TOKEN)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
