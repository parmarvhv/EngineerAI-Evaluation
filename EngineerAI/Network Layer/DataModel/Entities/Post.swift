//
//  Post.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import JSONParsing

public struct Post: JSONParseable {
    
    public var createdAt: String
    public var title: String
    
    
    public static func parse(_ json: JSON) throws -> Post {
        return try Post(createdAt: json["created_at"]^,
                        title: json["title"]^)
    }
    
}
