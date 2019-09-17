//
//  APIConfiguration.swift
//  MVVM
//
//  Created by Mattia on 17/09/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import Foundation

struct APIConfiguration {
	let endpoint: String
	let apiVersion: String
	
	static let `default` = APIConfiguration(endpoint: "https://jsonplaceholder.typicode.com/api/", apiVersion: "v1")
}
