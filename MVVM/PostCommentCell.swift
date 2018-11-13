//
//  PostCommentCell.swift
//  MVVM
//
//  Created by Mattia on 02/10/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostCommentCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    func setup(with comment: Comment) {
        usernameLabel.text = comment.email
        commentLabel.text = comment.body
    }
    
}
