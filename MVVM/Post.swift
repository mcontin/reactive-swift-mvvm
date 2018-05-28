//
//  Post.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift

class Post: Object {
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    
    /// Relationships
    @objc dynamic var author: User?
    
    let comments = LinkingObjects(fromType: Comment.self, property: "post")

    convenience init(from json: PostJSON) {
        self.init()
        id = json.id
        title = json.title
        body = json.body
        
        author = LocalStore.getObject(type: User.self, for: json.userId)
    }
    
}
