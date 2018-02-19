//
//  ForumAPI.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper


extension API {
    
    static func getPosts() -> Single<[Post]> {
        return provider.rx
            .request(.getPosts)
            .filterSuccessfulStatusAndRedirectCodes()
            .mapArray(Post.self)
    }
    
}
