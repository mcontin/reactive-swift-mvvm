//
//  DashboardController.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class PostDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
	
    var postId = -1

	private var tableViewConfigurator: PostDetailConfigurator!
    private let disposeBag = DisposeBag()
    private let viewModel = PostDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let post = LocalStore.getObject(type: Post.self, for: self.postId) else {
			navigationController?.popViewController(animated: true)
			return
		}
		
		tableViewConfigurator = PostDetailConfigurator(post: post, comments: viewModel.comments)
		
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300 // arbitrary value, it's actually calculated based on constraints
        tableView.register(R.nib.postDetailCell)
        tableView.register(R.nib.postCommentCell)
		tableView.delegate = tableViewConfigurator
		tableView.dataSource = tableViewConfigurator
        
        viewModel.postId = postId
        
        fetchData()
    }
    
    private func fetchData() {
        viewModel.fetchComments()
            .subscribe(onCompleted: { [weak self] in
				guard let self = self else { return }
				
				self.tableViewConfigurator.comments = self.viewModel.comments
				self.tableView.reloadSections(IndexSet(arrayLiteral: 1), with: .automatic)
            }, onError: { [weak self] error in
                self?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }

}
