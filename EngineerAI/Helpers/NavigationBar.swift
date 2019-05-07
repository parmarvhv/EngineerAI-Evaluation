//
//  NavigationBar.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

private let barTintColor = UIColor.green
private let backImage: UIImage?  = nil

class NavigationBar: UINavigationBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let backImage = backImage {
            self.backIndicatorImage = backImage
            self.backIndicatorTransitionMaskImage = backImage
        }
        self.barTintColor = barTintColor
        self.tintColor = UIColor.black
        
        if #available(iOS 11.0, *) {
            let largeTitleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor : UIColor.black]
            self.largeTitleTextAttributes = largeTitleAttributes
        }
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                               NSAttributedString.Key.foregroundColor : UIColor.black]
        self.titleTextAttributes = titleAttributes
    }
    
}

extension UINavigationBar {
    
    func removeShadowImage() {
        self.isTranslucent = false
        self.shadowImage = nil
        self.setBackgroundImage(nil, for: .default)
    }
}
