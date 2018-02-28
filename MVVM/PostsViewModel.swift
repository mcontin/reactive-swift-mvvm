//
//  PostsViewModel.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RxSwift

class PostsViewModel {

    private let posts = Variable<[Post]>([])
    
    private let disposeBag = DisposeBag()
    
    var observablePosts: Observable<[Post]> {
        return posts.asObservable()
    }
    
    init() {
        fetchUsers()
            .andThen(fetchLocalPosts())
            .andThen(fetchRemotePosts())
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    func fetchUsers() -> Completable {
        return .create { completable in
            API.getUsers()
                .subscribe(onSuccess: { users in
                    LocalStore.save(objects: users)
                    completable(.completed)
                }, onError: { error in
                    print(error)
                    completable(.error(error))
                })
        }
    }
    
    private func fetchLocalPosts() -> Completable {
        return Completable.create { [weak self] completable in
            guard let this = self else {
                return Disposables.create()
            }
            
            this.posts.value = LocalStore.getObjects(ofType: Post.self)
            LocalStore.save(posts: this.posts.value)
            completable(.completed)
            return Disposables.create()
        }
    }
    
    private func fetchRemotePosts() -> Completable {
        return Completable.create { [weak self] completable in
            guard let this = self else {
                return Disposables.create()
            }
            return API.getPosts()
                .subscribe(onSuccess: { posts in
                    this.posts.value = posts
                    LocalStore.save(posts: this.posts.value)
                    completable(.completed)
                }, onError: { error in
                    print(error)
                    completable(.error(error))
                })
        }
    }
    
    func postId(for indexPath: IndexPath) -> Int? {
        let index = indexPath.row
        
        guard index < posts.value.count else {
            return nil
        }
        
        return posts.value[index].id
    }
}
