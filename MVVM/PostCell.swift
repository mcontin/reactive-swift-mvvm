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
    
	func setup(with post: Post) {
		authorLabel.text = post.author?.username
		titleLabel.text = post.title
		previewLabel.text = post.body
	}
    
}
