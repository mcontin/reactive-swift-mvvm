//
//  PostCell.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    var model: Post? {
        didSet {
            authorLabel.text = model?.author?.username
            titleLabel.text = model?.title
            previewLabel.text = model?.body
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}
