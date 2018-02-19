//
//  PostsViewModel.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RxSwift
import RealmSwift

class PostsViewModel {

    private let posts = Variable<[Post]>([])
    
    private let disposeBag = DisposeBag()
    
    var observablePosts: Observable<[Post]> {
        return posts.asObservable()
    }
    
    init() {
        fetchLocalPosts()
            .andThen(fetchRemotePosts())
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    private func fetchLocalPosts() -> Completable {
        return Completable.create { [unowned self] completable in
            self.posts.value = LocalStore.retrievePosts()
            LocalStore.save(posts: self.posts.value)
            return Disposables.create()
        }
    }
    
    private func fetchRemotePosts() -> Completable {
        return Completable.create { [unowned self] completable in
            print(self.posts.value.first!)
//            self.posts.value = PostsStore.retrievePosts()
//            PostsStore.save(posts: self.posts.value)
            return Disposables.create()
        }
    }
    
    func binder(row: Int, element: Post, cell: PostCell) {
        cell.authorLabel.text = element.author?.username
        cell.titleLabel.text = element.title
        cell.previewLabel.text = element.body
    }
    
    func postId(for indexPath: IndexPath) -> Int? {
        let index = indexPath.row
        
        guard index < posts.value.count else {
            return nil
        }
        
        return posts.value[index].id
    }
}
