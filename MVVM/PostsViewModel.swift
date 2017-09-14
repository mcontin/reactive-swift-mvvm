//
//  PostsViewModel.swift
//  MVVM
//
//  Created by Mattia on 28/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit

class PostsViewModel {

    var post: Post
    
    var author: String {
        return post.title
    }
    
    var title: String {
        return post.title
    }
    
    var body: String {
        return post.body
    }
    
    init(withPost post: Post) {
        self.post = post
    }

}
