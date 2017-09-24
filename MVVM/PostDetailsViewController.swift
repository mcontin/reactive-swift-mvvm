//
//  DashboardController.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    let kPostSection = 0
    let kCommentsSection = 1
    
    @IBOutlet weak var tableView: UITableView!
    
    var postId = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fetch comments and then user albums
    }

}
