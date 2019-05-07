//
//  PostRouter.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit

public enum PostRouter: BaseRouter {
    
    case fetchPosts(page: Int)
    
    public var method: HTTPMethod {
        switch self {
        case .fetchPosts:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .fetchPosts:
            return "search_by_date"
        }
    }
    
    public var params: [String: Any] {
        var params: [String: Any] = [:]
        switch self {
        case .fetchPosts (let page):
            params["tags"] = "story"
            params["page"] = page
        }
        return params
    }
    
    public var keypathToMap: String? {
        return nil
    }
    
}
