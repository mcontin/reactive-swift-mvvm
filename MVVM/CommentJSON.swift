//
//  CommentJSON.swift
//  MVVM
//
//  Created by CrispyBacon018 on 28/05/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Foundation

struct CommentJSON: Codable {
    
    let id: Int
    let name: String
    let email: String
    let body: String
    let postId: Int
    
}
