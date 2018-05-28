//
//  PostJSON.swift
//  MVVM
//
//  Created by CrispyBacon018 on 28/05/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Foundation

struct PostsJSON: Codable {
    
}

struct PostJSON: Codable {
    
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
}
