//
// Created by Mattia on 25/10/2017.
// Copyright (c) 2017 Mattia. All rights reserved.
//

import Moya

enum ForumService {
    case getPosts
    case deletePost(id: Int)
//    case createPost

    case getUsers

    case getPostComments(postId: Int)
    case deleteComment(id: Int)
//    case createComment
}

extension ForumService: TargetType {

    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
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
        switch self {
        case .getPosts, .getUsers, .getPostComments, .deletePost, .deleteComment: // Send no parameters, the request is all explained in .path
            return .requestPlain
//        case :  // Always sends parameters in URL, regardless of which HTTP method is used
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        }
    }

    var sampleData: Data {
        switch self {
        case .getPosts:
            return "[{\"userId\": 1, \"id\": \"1\", \"title\": \"sample post title\", \"body\": \"sample post body\"}]".utf8Encoded
        case .deletePost:
            return "{}".utf8Encoded
        case .getUsers:
            return "[{\"userId\": 1, \"id\": \"1\", \"title\": \"sample post title\", \"body\": \"sample post body\"}]".utf8Encoded
        case .getPostComments:
            return "[{\"postId\": 1, \"id\": \"1\", \"name\": \"sample commenter name\", \"email\": \"sample commenter email\", \"body\": \"sample comment body\"}]".utf8Encoded
        case .deleteComment:
            return "{}".utf8Encoded
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
