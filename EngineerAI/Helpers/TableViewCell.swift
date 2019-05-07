//
//  TableViewCell.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) {
        
    }
    
}


class TableHeaderFooterView: UITableViewHeaderFooterView {
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) {
        
    }
    
}
