//
//  DataModel.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import FoxAPIKit

public typealias APICompletion<T> = (APIResult<T>) -> Void

public class DataModel {
    
    public static let shared = DataModel()
    private let userDefaults = UserDefaults.standard
    
    private init() { }
    
}
