//
//  FeastedApi.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/19/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import CoreLocation
import Foundation
import ObjectMapper


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
    
    func getMeals(location : CLLocationCoordinate2D, radius : Double, completion: (meals: Array<Meal>?, error: NSError?) -> Void)
    {
        let mealRequest = MealRequest.GetMeals(lat: location.latitude, lng: location.longitude, radius: radius, limit: 10.0)
        Alamofire.request(mealRequest).responseArray("meals", completionHandler: { (response: Response<[Meal], NSError>) -> Void in
            switch response.result {
            case .Success(let meals):
                completion(meals: meals, error: nil)
                break
            case .Failure(let error):
                completion(meals: nil, error: error)
                break
            }
        })
    }
    
    func createMeal(meal : Meal, completion: (meal: Meal?, error: NSError?) -> Void)
    {
        let mealJSON = Mapper<Meal>().toJSON(meal)
        let request = MealRequest.CreateMeal(meal: mealJSON)
        Alamofire.request(request).responseObject("meal") { (response: Response<Meal, NSError>) -> Void in
            switch response.result {
            case .Success(let meal):
                completion(meal: meal, error: nil)
                break
            case .Failure(let error):
                completion(meal: nil, error: error)
                break
            }
        }
    }
}