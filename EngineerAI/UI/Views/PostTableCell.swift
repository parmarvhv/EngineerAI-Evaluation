//
//  PostTableCell.swift
//  EngineerAI
//
//  Created by Vaibhav Parmar on 07/05/19.
//  Copyright © 2019 Vaibhav. All rights reserved.
//

import UIKit

struct PostTableCellModel {
    var createdAt: String
    var title: String
}

class PostTableCell: TableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(_ item: Any?) {
        guard let cellModel = item as? PostTableCellModel else { return }
        self.titleLabel.text = cellModel.title
        self.createdAtLabel.text = cellModel.createdAt
    }
    
}
