//
//  MealRequest.swift
//  Feasted
//
//  Created by Joshua Newkirk on 3/2/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Alamofire

enum MealRequest : URLRequestConvertible
{
    private static let baseURLString = FeastedAPI.sharedInstance.serviceEndpoint()
    private static var bearerToken : String? = FeastedAPI.sharedInstance.bearerToken()
    
    case GetMeal(mealId:String)
    case GetMeals(lat:Double, lng:Double, radius:Double, limit:Double)
    case CreateMeal(meal:[String : AnyObject])
    case DestroyMeal(mealId:String)
    
    private var method : Alamofire.Method {
        switch self {
        case .GetMeal:
            return .GET
        case .GetMeals:
            return .GET
        case .CreateMeal:
            return .POST
        case .DestroyMeal:
            return .DELETE
        }
    }
    
    private var path : String {
        switch self {
        case .GetMeal(let mealId):
            return "/meals/\(mealId)"
        case .GetMeals(_, _, _, _):
            return "/meals"
        case .CreateMeal(_):
            return "/meals"
        case .DestroyMeal(let mealId):
            return "/meals/\(mealId)"
        }
    }
    
    // Parameters for request
    private var parameters : [String:AnyObject]? {
        switch self {
            
        case .GetMeal(let mealId):
            return ["meal_id" : mealId]
            
        case .GetMeals(let lat, let lng, let range, let limit):
            let nillableParameters = [
                "lat":lat,
                "lng":lng,
                "range":range,
                "limit":limit]
            return nillableParameters
            
        case .CreateMeal(let meal):
            return ["":meal]
            
        case .DestroyMeal(let mealId):
            return ["mealId":mealId]
        }
    }
    
    var URLRequest : NSMutableURLRequest {
        let URL = NSURL(string: MealRequest.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = MealRequest.bearerToken {
            mutableURLRequest.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        switch self {
            
        default:
            return mutableURLRequest
        }
    }
}