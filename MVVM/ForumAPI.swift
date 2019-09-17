//
//  ForumAPI.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import RxSwift
import Moya

extension ForumAPI {
    
    func getPosts() -> Single<[PostJSON]> {
        return provider.rx
            .request(.getPosts)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([PostJSON].self)
    }
    
    func getUsers() -> Single<[UserJSON]> {
        return provider.rx
            .request(.getUsers)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([UserJSON].self)
    }
    
    func getComments(for postId: Int) -> Single<[CommentJSON]> {
        return provider.rx
            .request(.getPostComments(postId: postId))
            .filterSuccessfulStatusAndRedirectCodes()
            .map([CommentJSON].self)
    }
    
}
