//
//  ForumAPI.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import RxSwift
import Moya

fileprivate struct BackendError: Error, Codable {
	let msg: String
	
}

extension API {
    
    static func getPosts() -> Single<[PostJSON]> {
        return provider.rx
            .request(.getPosts)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([PostJSON].self)
			
			
//			.catchError { error -> PrimitiveSequence<SingleTrait, [PostJSON]> in
//				return .create { single -> Disposable in
//					guard let moyaError = error as? MoyaError else {
//						single(.error(error))
//						return Disposables.create()
//					}
//					do {
//						let a = try moyaError.response?.map(BackendError.self)
//						single(.error(a ?? error))
//					} catch {
//						single(.error(error))
//					}
//					return Disposables.create()
//				}
//			}
    }
	
	static func deletePost(with id: Int) -> Completable {
		return provider.rx
			.request(.deletePost(id: id))
			.filterSuccessfulStatusAndRedirectCodes()
			.asObservable().ignoreElements()
	}
	
    static func getUsers() -> Single<[UserJSON]> {
        return provider.rx
            .request(.getUsers)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([UserJSON].self)
    }
    
    static func getComments(for postId: Int) -> Single<[CommentJSON]> {
        return provider.rx
            .request(.getPostComments(postId: postId))
            .filterSuccessfulStatusAndRedirectCodes()
            .map([CommentJSON].self)
    }
    
}
