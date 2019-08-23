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
    
    private let postsViewModel = PostsViewModel()
	private lazy var postsConfigurator: PostsListConfigurator = {
		let configurator = PostsListConfigurator(posts: [])
		configurator.didSelectPost = { [weak self] post in
			guard let self = self else { return }
			
			self.performSegue(withIdentifier: R.segue.postsViewController.kSeguePostDetails,
							  sender: post.id)
		}
		return configurator
	}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        tableView.register(UINib(resource: R.nib.postCell), forCellReuseIdentifier: R.reuseIdentifier.postCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100 // arbitrary value, it's actually calculated based on constraints
		tableView.delegate = postsConfigurator
		tableView.dataSource = postsConfigurator
		
		postsViewModel.observablePosts
			.subscribe(onNext: { [weak self] posts in
				self?.postsConfigurator.posts = posts
				self?.tableView.reloadData()
			})
			.disposed(by: disposeBag)
		
		postsViewModel.sync()
			.subscribe()
			.disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == R.segue.postsViewController.kSeguePostDetails.identifier,
            let destination = segue.destination as? PostDetailViewController,
            let postId = sender as? Int else {
                return
        }

        destination.postId = postId
    }
    
}
