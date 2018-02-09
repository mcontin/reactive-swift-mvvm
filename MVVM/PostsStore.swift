//
//  PostsStore.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift
import RxSwift

class PostsStore {
    
    static func retrievePosts() -> [Post] {
        Networker.fetchPosts()
            .subscribe(onNext: { posts in
                print(posts)
            }, onError: { error in
                print(error)
            })
        .disposed(by: DisposeBag())
        
        return getMockPosts()
    }
    
    static func getMockPosts() -> [Post] {
        let user = User()
        let posts: [Post] = (0..<20).map { index in
            let tempPost = Post()
            tempPost.id = index
            tempPost.author = user
            tempPost.author?.username = "Poster \(index + 1)"
            tempPost.title = "This is title number \(index + 1)"
            tempPost.body = "This is body number \(index + 1)"
            return tempPost
        }
        return (0..<20).map { index in
            let tempPost = Post()
            tempPost.id = index
            tempPost.author = user
            tempPost.author?.username = "Poster \(index + 1)"
            tempPost.title = "This is title number \(index + 1)"
            tempPost.body = "This is body number \(index + 1)"
            return tempPost
        }
    }
    
    @discardableResult
    static func save(post: Post) -> Bool {
        let realm = Realm.unsafeGet()
        
        do {
            try realm.write {
                realm.add(post, update: true)
            }
        } catch let error {
            debugPrint(error)
            return false
        }
        
        return true
    }
    
    @discardableResult
    static func save(posts: [Post]) -> Bool {
        do {
            let realm = Realm.safeGet()
            try realm?.write {
                realm?.add(posts, update: true)
            }
        } catch let error {
            debugPrint(error)
            return false
        }
        
        return true
    }
    
}
