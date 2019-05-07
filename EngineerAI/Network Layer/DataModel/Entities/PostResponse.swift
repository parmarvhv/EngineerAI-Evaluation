//
//  PostResponse.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import JSONParsing

public struct PostResponse: JSONParseable {
    
    public var nbPages: Int
    public var posts: [Post]
    
    
    public static func parse(_ json: JSON) throws -> PostResponse {
        return try PostResponse(nbPages: json["nbPages"]^,
                                posts: json["hits"].arrayValue.map(^))
    }
    
}
