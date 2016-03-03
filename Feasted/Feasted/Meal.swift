//
//  Meal.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class Meal : Mappable
{
    var mealId: String?
    var name: String?
    var description: String?
    var ingredients: [Ingredient]?
    var location: CLLocation?
    var availableFrom: NSDate?
    var availableTo: NSDate?
    var lastUpdated: NSDate?
    var isActive: Bool?
    var portions: Int?
    var portionsAvailable: Int?
    var price: Double?
//    var metadata: [MealMetaData]?
    var allergens: [Allergen]?
    var previewImageUrl: String?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        mealId <- map["meal_id"]
        name <- map["name"]
        description <- map["description"]
        ingredients <- map["ingredients"]
        location <- map["location"]
        availableFrom <- (map["available_from"], DateTransform())
        availableTo <- (map["available_to"], DateTransform())
        lastUpdated <- (map["last_updated"], DateTransform())
        isActive <- map["is_active"]
        portions <- map["portions"]
        portionsAvailable <- map["portions_available"]
        price <- map["price"]
//        metadata <- map["metadata"]
        allergens <- map["allergens"]
        previewImageUrl <- map["preview_image_url"]
    }
}