//
//  DashboardController.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RealmSwift

class PostDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let kPostSection = 0
    let kCommentsSection = 1
    var postId = -1

    private let disposeBag = DisposeBag()
    private let viewModel = PostDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300 // arbitrary value, it's actually calculated based on constraints
        tableView.register(R.nib.postDetailCell)
        tableView.register(R.nib.postCommentCell)
        
        viewModel.postId = postId
        
        fetchData()
    }
    
    private func fetchData() {
        viewModel.fetchComments()
            .subscribe(onCompleted: {
                let dataSource = RxTableViewSectionedReloadDataSource<PostDetailSections>(configureCell: { _, tableView, indexPath, section  -> UITableViewCell in
                    switch section {
                    case .post(let post):
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postDetailCell, for: indexPath) else {
                            fatalError("Couldn't dequeue a PostDetailCell")
                        }
                        cell.setup(with: post)
                        return cell
                    case .comment(let comment):
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postCommentCell, for: indexPath) else {
                            fatalError("Couldn't dequeue a PostCommentCell")
                        }
                        cell.setup(with: comment)
                        return cell
                    }
                })
				
				dataSource.titleForHeaderInSection = { dataSource, index in
					if index == 1 {
						return "Comments"
					}
					return nil
				}
				
                guard let post = LocalStore.getObject(type: Post.self, for: self.postId) else {
                    self.navigationController?.popViewController(animated: true)
                    return
                }
                
                let sections = [
                    PostDetailSections.detailSection(header: "Details", items: [.post(customData: post)]),
                    PostDetailSections.commentsSection(header: "Comments", items: self.viewModel.comments.value.map { Row.comment(string: $0) })
                ]
                
                Observable.just(sections)
                    .bind(to: self.tableView.rx.items(dataSource: dataSource))
                    .disposed(by: self.disposeBag)
            }, onError: { [weak self] error in
                self?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }

}
