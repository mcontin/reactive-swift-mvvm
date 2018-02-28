//
//  ViewController.swift
//  MVVM
//
//  Created by Mattia on 26/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostsViewController: RxViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    /// View model for the list of posts. Posts are fetched when this is initialized.
    private let postsViewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(R.nib.postCell(), forCellReuseIdentifier: R.reuseIdentifier.postCell.identifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 95
        
        postsViewModel.observablePosts
            .bind(to: tableView.rx.items(cellIdentifier: R.reuseIdentifier.postCell.identifier,
                                         cellType: PostCell.self))
            { _, post, cell in
                cell.model = post
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .bind { indexPath in
                self.performSegue(withIdentifier: R.segue.postsViewController.kSeguePostDetails,
                                  sender: self.postsViewModel.postId(for: indexPath))
            }
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.postsViewController.kSeguePostDetails.identifier,
            let destination = segue.destination as? PostDetailViewController,
            let postId = sender as? Int {
            destination.postId = postId
        }
    }
    
}
