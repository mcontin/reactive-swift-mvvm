//
//  APIWrapper.swift
//  MVVM
//
//  Created by Mattia on 17/09/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import Moya

protocol APIWrapper {
	associatedtype T: TargetType
	var provider: MoyaProvider<T> { get }
	var endpoint: String { get }
	var apiVersion: String { get }
}
