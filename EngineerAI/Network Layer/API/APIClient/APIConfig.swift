//
//  APIConfig.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation

public struct APIConfig {
    
    struct Constants {
        static let bundleIdentifier = Bundle.main.bundleIdentifier!
    }
    
    struct APIUrl {
        static let Base = APIUrl.baseUrl
        //https://hn.algolia.com/api/v1/search_by_date?tags=story&page=1
        private static let baseUrl = "https://hn.algolia.com/api/v1/"
    }
    
}
