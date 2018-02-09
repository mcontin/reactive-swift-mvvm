//
//  Networker.swift
//  MVVM
//
//  Created by Mattia on 25/10/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import Moya
import Moya_ObjectMapper
import ObjectMapper
import RxSwift
import RealmSwift

struct Networker {
    
    static func fetchUsers() -> Observable<[User]> {
        return fetchArray(endpoint: .getUsers)
    }

    static func fetchPosts() -> Observable<[Post]> {
        return fetchArray(endpoint: .getPosts)
    }

    static func fetchArray<T: Object>(endpoint: ForumService) -> Observable<[T]> where T: Mappable {
        return Observable.create { observer in
            let provider = MoyaProvider<ForumService>()
            
            provider.request(endpoint) { result in
                switch result {
                case .success(let response):
                    do {
                        let posts = try response.mapArray(T.self)
                        observer.on(.next(posts))
                    } catch let error {
                        observer.onError(error)
                    }
                    observer.on(.completed)
                case .failure(let error):
                    print(error)
                    // this means there was a network failure, if 4xx or 500x, .success is called
                }
            }
            return Disposables.create()
        }
    }

}
