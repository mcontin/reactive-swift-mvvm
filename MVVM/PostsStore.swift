//
//  PostsStore.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import Foundation

class PostsStore {
    
    static func retrievePosts() -> [Post] {
        // start online default
        
        return getMockPosts()
    }
    
    static func getMockPosts() -> [Post] {
        let posts: [Post] = (0..<20).map { index in
            let tempPost = Post()
            tempPost.id = index
            tempPost.author = User()
            tempPost.author?.username = "Poster \(index + 1)"
            tempPost.title = "This is title number \(index + 1)"
            tempPost.body = "This is body number \(index + 1)"
            return tempPost
        }
        return posts
    }
    
}
