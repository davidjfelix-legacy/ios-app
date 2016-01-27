//
//  FeastedService.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/20/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Alamofire

class FeastedService: NSObject {
    
    // private vars
    private(set) var isProduction : Bool!
    
    // private static strings
    private static let SERVER : String = "http://dinner-solutions-api"
    private static let STAGE_SERVER : String = "https://unknown"
    
    override init() {
        self.isProduction = false
    }
    
    func getServiceEnpoint() -> String {
        return (self.isProduction == true) ? FeastedService.SERVER : FeastedService.STAGE_SERVER
    }
}