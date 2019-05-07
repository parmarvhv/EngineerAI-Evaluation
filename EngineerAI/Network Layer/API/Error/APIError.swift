//
//  APIError.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import AnyErrorKit

public enum APIError: AnyError {
    
    case authTokenNil
    case userNotLoggedOn
    case userDetailUnavailable
    case custom(error: AnyError)
    
    public var code: Int {
        switch self {
        case .authTokenNil, .userNotLoggedOn,
             .userDetailUnavailable:
            return 0
        case .custom(let error):
            return error.code
        }
    }
    
    public var domain: String {
        switch self {
        case .authTokenNil, .userNotLoggedOn, .userDetailUnavailable:
            return "API Error"
        case .custom(let error):
            return error.domain
        }
    }
    
    public var message: String {
        switch self {
        case .authTokenNil:
            return "Auth Token is Nil"
        case .userNotLoggedOn:
            return "User not logged on"
        case .userDetailUnavailable:
            return "User detail unavailable"
        case .custom(let error):
            return error.message
        }
    }
    
}
