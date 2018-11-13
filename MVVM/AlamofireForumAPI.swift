//
//  AlamofireForumAPI.swift
//  MVVM
//
//  Created by CrispyBacon018 on 05/11/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
	
	struct Endpoints {
		static let getPosts = "https://httpbin.org/get"
	}
	
	/*
	static func getPosts() -> Single<[PostJSON]> {
		return provider.rx
			.request(.getPosts)
			.filterSuccessfulStatusAndRedirectCodes()
			.map([PostJSON].self)
	}
	*/
	
	static func getPosts(completion: @escaping ([PostJSON]) -> Void, failure: @escaping (Error) -> Void) {
		Alamofire
			.request(Endpoints.getPosts)
			.validate(statusCode: 200..<300)
			.responseJSON { response in
				switch response.result {
				case .success(let value):
					guard let decodedObject = value as? [PostJSON] else {
						DispatchQueue.main.async {
							failure(ServiceError.serializationKO)
						}
						return
					}
					completion(decodedObject)
				case let .failure(err):
					guard let decodedObject = err as? ResponseError else {
						failure(err)
						return
					}
					failure(ServiceError.getError(from: decodedObject.code))
				}
		}
	}
	
}

enum ServiceError: Error {
	case serializationKO
	
	static func getError(from code: Int) -> ServiceError {
		return .serializationKO
	}
}

enum ResponseError: Error {
	case badError
	case veryBadError
}
