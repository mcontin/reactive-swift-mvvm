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
    
    let dataSource = RxTableViewSectionedReloadDataSource<PostDetailSections>()
    
    let realm = Realm.unsafeGet()
    
    let kPostSection = 0
    let kCommentsSection = 1
    var postId = -1

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = realm.object(ofType: Post.self, forPrimaryKey: postId)
        
        post.getAs { post in
            let sections = [
                PostDetailSections.detailSection(header: "details", items: [.post(customData: post)])
//                PostDetailSections(header: "",
//                                  items: [post])
            ]
            
            dataSource.configureCell = { dataSource, tableView, indexPath, item  -> UITableViewCell in
                switch item {
                case .post(let post):
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailCell", for: indexPath) as! PostDetailCell
                    cell.labelTitle.text = post.title
                    cell.labelAuthor.text = post.author?.username
                    cell.labelBody.text = post.body
                    return cell
                case .comment(let comment):
                    debugPrint(comment)
                    break
                }
                
//                switch dataSource[indexPath] {
//                case .detailSection(let post):
//                    let cell: CustomDataCell = // dequeue cell
//                    self?.configure(cell: cell, with: customData)
//                    return cell
//
//                case .commentsSection(let string):
//                    let cell: StringCell = // dequeue cell
//                    self?.configure(cell: cell, with: string)
//                    return cell
//                }
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailCell", for: indexPath) as! PostDetailCell
                //            cell.textLabel?.text = "Item \(item.anInt): \(item.aString) - \(item.aCGPoint.x):\(item.aCGPoint.y)"
                return cell
            }
            
            //        dataSource.titleForHeaderInSection = { ds, index in
            //            return ds.sectionModels[index].header
            //        }
            
//            Observable.just(sections)
//                .bind(to: tableView.rx.items(dataSource: dataSource))
//                .disposed(by: disposeBag)
        }
        
    }

}
