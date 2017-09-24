//
//  PostsViewModel.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RxSwift

class PostsViewModel {

    private let posts: Variable<[Post]> = Variable([])
    
    var observablePosts: Observable<[Post]>{
        return posts.asObservable()
    }
    
    init() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        posts.value = PostsStore.getMockPosts()
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
