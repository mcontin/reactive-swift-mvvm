//
//  API.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Moya

class API {
	static let forum = ForumAPI()
}

class ForumAPI: APIWrapper {
	
	typealias T = ForumService
	
	let provider = MoyaProvider<ForumService>(plugins: [NetworkLoggerPlugin()])
	
	let endpoint: String
	let apiVersion: String
	
	init(configuration: APIConfiguration = .default) {
		self.endpoint = configuration.endpoint
		self.apiVersion = configuration.apiVersion
	}
	
}
