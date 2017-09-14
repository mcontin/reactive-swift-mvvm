//
//  PostCell.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let kCellIdentifier = "PostCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!

    var viewModel: PostsViewModel? {
        didSet {
            self.titleLabel.text = viewModel?.title
            self.previewLabel.text = viewModel?.body
            self.authorLabel.text = viewModel?.author
        }
    }
    
}
