//
// Created by Mattia on 25/10/2017.
// Copyright (c) 2017 Mattia. All rights reserved.
//

import Moya

enum ForumService {
    case getPosts
    case deletePost(id: Int)

    case getUsers

    case getPostComments(postId: Int)
    case deleteComment(id: Int)
}

extension ForumService: TargetType {
	
	private var testEnabled: Bool { return true }

    var baseURL: URL {
		if testEnabled {
			return URL(string: "http://demo0009797.mockable.io")!
		} else {
			return URL(string: "https://jsonplaceholder.typicode.com")!
		}
    }

    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
        case .deletePost(let id):
            return "/posts/\(id)"
        case .getUsers:
            return "/users"
        case .getPostComments(let postId):
            return "/posts/\(postId)/comments"
        case .deleteComment(let id):
            return "/comments/\(id)"
        }
    }

    var method: Method {
        switch self {
        case .getPosts, .getPostComments, .getUsers:
            return .get
        case .deletePost, .deleteComment:
            return .delete
        }
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }

}
