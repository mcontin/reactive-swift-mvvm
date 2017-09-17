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
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    
    /// Relationships
    @objc dynamic var author: User?
    let comments = LinkingObjects(fromType: Comment.self, property: "post")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
