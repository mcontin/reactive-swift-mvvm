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
        tableView.rowHeight = UITableViewAutomaticDimension
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
                            return UITableViewCell()
                        }
                        cell.setup(with: post)
                        return cell
                    case .comment(let comment):
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postCommentCell, for: indexPath) else {
                            return UITableViewCell()
                        }
                        cell.setup(with: comment)
                        return cell
                    }
                })
                
                guard let post = LocalStore.getObject(type: Post.self, for: self.postId) else {
                    self.navigationController?.popViewController(animated: true)
                    return
                }
                
                let sections = [
                    PostDetailSections.detailSection(header: "details", items: [.post(customData: post)]),
                    PostDetailSections.commentsSection(header: "comments", items: self.viewModel.comments.value.map { Row.comment(string: $0) })
                ]
                
                Observable.just(sections)
                    .bind(to: self.tableView.rx.items(dataSource: dataSource))
                    .disposed(by: self.disposeBag)
            }, onError: { error in
                
            })
            .disposed(by: disposeBag)
    }

}
