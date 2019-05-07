//
//  ErrorResponse.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing

private let errorKey = "error"

public struct ErrorResponse: ErrorResponseProtocol {
    
    public var code: Int
    public let messages: [String]
    
    public var message: String {
        return self.compiledErrorMessage
    }
    
    public var compiledErrorMessage: String {
        return self.messages.joined(separator: ",")
    }
    
    public var domain: String {
        return ""
    }
    
    public static func parse(_ json: JSON, code: Int) throws -> ErrorResponse {
        if 200...299 ~= code {
            throw NSError(domain: "", code: code, userInfo: nil)
        }
        return try ErrorResponse(code: code, messages: [json["message"]^])
    }
    
}


