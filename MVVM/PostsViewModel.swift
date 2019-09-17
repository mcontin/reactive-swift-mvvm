//
//  PostsViewModel.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RxSwift
import RxCocoa

class PostsViewModel {

    private let posts = BehaviorRelay<[Post]>(value: [])
	
    var observablePosts: Observable<[Post]> {
        return posts.asObservable()
    }
	
    private func fetchUsers() -> Completable {
        return .create { observer in
            API.forum.getUsers()
                .subscribe(onSuccess: { jsonUsers in
                    LocalStore.save(objects: jsonUsers.map { User(from: $0) })
                    observer(.completed)
                }, onError: { error in
                    print(error)
                    observer(.error(error))
                })
        }
    }
    
    private func fetchLocalPosts() -> Completable {
        return .create { [weak self] observer in
            guard let this = self else {
                return Disposables.create()
            }
            
            this.posts.accept(LocalStore.getObjects(ofType: Post.self))
            LocalStore.save(objects: this.posts.value)
            observer(.completed)
            return Disposables.create()
        }
    }
    
    private func fetchRemotePosts() -> Completable {
        return .create { [weak self] observer in
            API.forum.getPosts()
                .subscribe(onSuccess: { jsonPosts in
                    guard let this = self else {
                        observer(.error(NSError.with(message: "Self got deallocated during the network call :c")))
                        return
                    }
                    
                    this.posts.accept(jsonPosts.map { Post(from: $0) })
                    LocalStore.save(objects: this.posts.value)
                    observer(.completed)
                }, onError: { error in
                    print(error)
                    observer(.error(error))
                })
        }
    }
	
	func sync() -> Completable {
		return fetchUsers()
			.andThen(fetchLocalPosts())
			.andThen(fetchRemotePosts())
	}
    
    func postId(for indexPath: IndexPath) -> Int? {
        let index = indexPath.row
        
        guard index < posts.value.count else {
            return nil
        }
        
        return posts.value[index].id
    }
    
}
