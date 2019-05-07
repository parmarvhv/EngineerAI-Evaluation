//
//  BaseRouter.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit

public protocol BaseRouter: Router {
    
}

extension BaseRouter {
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return ""
    }
    
    public var params: [String: Any] {
        return [:]
    }
    
    public var baseUrl: URL {
        return URL(string: APIConfig.APIUrl.Base)!
    }
    
    public var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    public var encoding: URLEncoding? {
        return nil
    }
    
    public var timeoutInterval: TimeInterval? {
        return nil
    }
    
    public var keypathToMap: String? {
        return nil
    }
    
}

