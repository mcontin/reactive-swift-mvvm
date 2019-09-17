//
//  PostDetailViewModel.swift
//  MVVM
//
//  Created by Mattia on 24/09/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RxSwift
import RxCocoa

class PostDetailViewModel {
    
    var postId: Int?
	var comments: [Comment] = []
	
    func fetchComments() -> Completable {
        guard let postId = postId else {
            return .error(NSError.with(message: "PostId nil"))
        }
        
        return .create { [weak self] observer in
            return API.forum.getComments(for: postId)
                .subscribe(onSuccess: { comments in
                    guard let this = self else { return }
                    this.comments = comments.map { Comment(with: $0) }
                    observer(.completed)
                }, onError: { error in
                    observer(.error(error))
                })
        }
    }
    
}
