//
//  Comment.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift

class Comment: Object {
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var body = ""
    
    /// Relationships
    @objc dynamic var post: Post?
    
    convenience init(with json: CommentJSON) {
        self.init()
        
        id = json.id
        name = json.name
        email = json.email
        body = json.body
        
        post = LocalStore.getObject(type: Post.self, for: json.postId)
    }
    
}
