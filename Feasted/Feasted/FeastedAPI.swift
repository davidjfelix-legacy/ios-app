//
//  FeastedApi.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Alamofire

class FeastedAPI: NSObject {
    
    // Singleton Variable
    static let sharedInstance = FeastedAPI()
    
    // Private vars
    private var authManager : AuthManager!
    private var service : FeastedService!
    // TODO: Persistence Manager
    
    // Public vars
    
    private override init() {
        self.authManager = AuthManager()
        self.service = FeastedService()
    } //This prevents others from using the default '()' initializer for this class.
    
    
    func serviceEndpoint() -> String {
        return self.service.getServiceEnpoint()
    }
    
    func bearerToken() -> String? {
        return self.authManager.getBearerToken()
    }
}