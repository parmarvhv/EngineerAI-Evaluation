//
//  SectionModel.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation

class SectionModel {
    
    var headerViewModel: Any?
    var cellModels: [Any] = []
    var footerViewModel: Any?
    
    init(headerViewModel: Any? = nil, cellModels: [Any] = [], footerViewModel: Any? = nil) {
        self.headerViewModel = headerViewModel
        self.cellModels = cellModels
        self.footerViewModel = footerViewModel
    }
}
