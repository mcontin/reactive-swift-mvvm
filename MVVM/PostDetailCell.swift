//
//  PostDetailCell.swift
//  MVVM
//
//  Created by Mattia on 24/09/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostDetailCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
    func setup(with post: Post) {
        labelTitle.text = post.title
        labelAuthor.text = post.author?.username
        labelBody.text = post.body
    }
    
}
