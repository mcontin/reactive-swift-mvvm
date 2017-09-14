//
//  Post.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RealmSwift

class Post: Object {
    
    /// Primary key
    dynamic var id = 0
    
    /// Properties
    dynamic var title = ""
    dynamic var body = ""
    
    /// Relationships
    dynamic var user: User?
    let comments = LinkingObjects(fromType: Comment.self, property: "post")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
