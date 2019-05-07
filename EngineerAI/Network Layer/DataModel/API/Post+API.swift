//
//  Post+API.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit

extension Post {
    
    public static func fetchPosts(page: Int,
                                  completion: @escaping APICompletion<PostResponse>) {
        let router = PostRouter.fetchPosts(page: page)
        EngineerAiApiClient.shared.request(router, completion: completion)
    }
    
}
