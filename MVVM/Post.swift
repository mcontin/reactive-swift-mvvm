//
//  Post.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Post: Object, Mappable {
    
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
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        
        var userId = -1
        userId <- map["userId"]
        let realm = Realm.unsafeGet()
        let user = realm.object(ofType: User.self, forPrimaryKey: userId)
        author = user
    }
    
}
