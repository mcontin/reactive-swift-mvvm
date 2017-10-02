//
//  PostDetailCell.swift
//  MVVM
//
//  Created by Mattia on 24/09/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RxDataSources

class PostDetailCell: UITableViewCell {
    
    static let kCellIdentifier = "PostDetailCell"
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
}
