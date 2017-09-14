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
    
    let posts: Variable<[Post]> = Variable([])
    let postsViewModel: PostsViewModel = PostsViewModel(withPost: Post())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { (row, element, cell) in
                self.postsViewModel.post = element
                cell.viewModel = self.postsViewModel
            }
            .disposed(by: disposeBag)
        
        posts.value = PostsStore.getPosts()
        
        // fetch posts if not present
    }

}
