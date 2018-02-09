//
//  Comment.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Comment: Object, Mappable {
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var body = ""
    
    /// Relationships
    @objc dynamic var post: Post?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
        
        var postId = -1
        postId <- map["postId"]
        let realm = Realm.unsafeGet()
        let localPost = realm.object(ofType: Post.self, forPrimaryKey: postId)
        post = localPost
    }
    
}
