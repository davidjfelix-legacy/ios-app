//
//  FeastedApi.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation

class FeastedApi: NSObject {
    
    // Private vars
    let authManager : AuthManager
    
    init(authManager : AuthManager) {
        self.authManager = authManager
    }
}