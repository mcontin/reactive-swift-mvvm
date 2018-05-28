//
//  User.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift

class User: Object {
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var username = ""
    
    /// Relationships
    let posts = LinkingObjects(fromType: Post.self, property: "author")
    
    convenience init(from json: UserJSON) {
        self.init()
        id = json.id
        username = json.username
    }
    
}
