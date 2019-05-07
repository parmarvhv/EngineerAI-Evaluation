//
//  AuthHeaders.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit
import JSONParsing

public struct AuthHeaders: AuthHeadersProtocol {
    let accessToken: String
    
    public static func parse(_ json: JSON) throws -> AuthHeaders {
        return try AuthHeaders(
            accessToken: json[accessTokenKey]^
        )
    }
    
    public func toJSON() -> [String: String] {
        let res: [String: String] = [
            accessTokenKey: self.accessToken
        ]
        return res
    }
    
    public var isValid: Bool {
        return !self.accessToken.isEmpty
    }
    
}

extension AuthHeaders {
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.addValue(self.accessToken, forHTTPHeaderField: accessTokenKey)
        return urlRequest
    }
}

private let accessTokenKey = "Authorization"
