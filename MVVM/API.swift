//
//  API.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Moya

struct API {
    
    static let provider = MoyaProvider<ForumService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    private static let endpoint = ""
    
    static var v1: String {
        return endpoint + "/api/v1"
    }
    
    static var latest: String {
        return v1
    }
    
}
