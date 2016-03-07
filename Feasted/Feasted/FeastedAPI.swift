//
//  FeastedApi.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Alamofire
import CoreLocation
import Foundation

class FeastedAPI
{
    // Singleton Variable
    static let sharedInstance = FeastedAPI()
    
    // Private vars
    private var authManager : AuthManager!
    private var service : FeastedService!
    // TODO: Persistence Manager
    
    // Public vars
    
    private init()
    {
        self.authManager = AuthManager()
        self.service = FeastedService()
    } //This prevents others from using the default '()' initializer for this class.
    
    func serviceEndpoint() -> String
    {
        return self.service.getServiceEnpoint()
    }
    
    func bearerToken() -> String?
    {
        return self.authManager.getBearerToken()
    }
    
    func getMeals(location : CLLocationCoordinate2D, radius : Double)
    {
        // -> (meals: Array<Meal>, error: NSError)
        let mealRequest = MealRequest.GetMeals(lat: location.latitude, lng: location.longitude, radius: radius, limit: 10.0)
        Alamofire.request(mealRequest).response { (request, response, responseObject, error) -> Void in
            print(request)
            print(response)
            print(responseObject)
            print(error)
        }
    }
}