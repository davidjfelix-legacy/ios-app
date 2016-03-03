//
//  UserRequest.swift
//  Feasted
//
//  Created by Joshua Newkirk on 1/27/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Alamofire

enum UserRequest : URLRequestConvertible
{
    static let baseURLString = FeastedAPI.sharedInstance.serviceEndpoint()
    static var bearerToken: String? = FeastedAPI.sharedInstance.bearerToken()
    
    case CreateUser([String: AnyObject])
    case ReadUser(Int)
    case UpdateUser(Int, [String: AnyObject])
    case DestroyUser(Int)
    
    var method: Alamofire.Method {
        switch self {
        case .CreateUser:
            return .POST
        case .ReadUser:
            return .GET
        case .UpdateUser:
            return .POST
        case .DestroyUser:
            return .DELETE
        }
    }
    
    var path: String {
        switch self {
        case .CreateUser:
            return "/user"
        case .ReadUser(let userId):
            return "/user/\(userId)"
        case .UpdateUser(let userId, _):
            return "/user/\(userId)"
        case .DestroyUser(let userId):
            return "/user/\(userId)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: UserRequest.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = UserRequest.bearerToken {
            mutableURLRequest.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .CreateUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateUser(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}