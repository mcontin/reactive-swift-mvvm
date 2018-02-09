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

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    /// View model for the list of posts. Posts are fetched when this is initialized.
    lazy var postsViewModel: PostsViewModel = {
        return PostsViewModel()
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postsViewModel.observablePosts
            .bind(to: tableView.rx.items(cellIdentifier: PostCell.kCellIdentifier,
                                         cellType: PostCell.self),
                  curriedArgument: postsViewModel.binder)
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe { indexPath in
                indexPath.element.getAs { indexPath in
                    self.performSegue(withIdentifier: Segue.showPostDetails,
                                      sender: self.postsViewModel.postId(for: indexPath))
                }
            }
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.showPostDetails,
            let destination = segue.destination as? PostDetailViewController,
            let postId = sender as? Int {
            destination.postId = postId
        }
    }
    
}
