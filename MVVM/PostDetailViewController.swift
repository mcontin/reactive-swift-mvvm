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
    
    let dataSource = RxTableViewSectionedReloadDataSource<PostDetailSections>(configureCell: { _, _, _, _ in fatalError("Configure cell not implemented.") })
    
    let realm = Realm.unsafeGet()
    
    let kPostSection = 0
    let kCommentsSection = 1
    var postId = -1

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        let post = realm.object(ofType: Post.self, forPrimaryKey: postId)
        
        post.getAs { post in
            let sections = [
                PostDetailSections.detailSection(header: "details", items: [.post(customData: post)]),
                PostDetailSections.commentsSection(header: "comments", items: [])
            ]
            
            dataSource.configureCell = { dataSource, tableView, indexPath, item  -> UITableViewCell in
                switch item {
                case .post(let post):
                    let cell = tableView.dequeueReusableCell(withIdentifier: PostDetailCell.kCellIdentifier, for: indexPath) as! PostDetailCell
                    cell.labelTitle.text = post.title
                    cell.labelAuthor.text = post.author?.username
                    cell.labelBody.text = post.body
                    return cell
                case .comment(_):
                    let cell = tableView.dequeueReusableCell(withIdentifier: PostCommentCell.kCellIdentifier, for: indexPath) as! PostCommentCell
                    return cell
                }
            }
            
            Observable.just(sections)
                .bind(to: tableView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
        }
    }

}

extension PostDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
        default:
            return 40
        }
    }
    
}
