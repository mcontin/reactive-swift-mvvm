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
    
    let postsViewModel = PostsViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsViewModel.posts.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: PostCell.kCellIdentifier, cellType: PostCell.self))
            { (row, element, cell) in
                cell.authorLabel.text = element.author?.username
                cell.titleLabel.text = element.title
                cell.previewLabel.text = element.body
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe { indexPath in
                // go to post detail controller
            }
            .addDisposableTo(disposeBag)
        
        postsViewModel.posts.value = PostsStore.getMockPosts()
    }

}
