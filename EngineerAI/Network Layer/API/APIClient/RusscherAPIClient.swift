//
//  EngineerAiAPIClient.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit

class EngineerAiApiClient: APIClient<AuthHeaders, ErrorResponse> {
    
    static let shared = EngineerAiApiClient()
    
    override init() {
        super.init()
        #if DEBUG
        enableLogs = true
        #else
        enableLogs = false
        #endif
    }
    
}
