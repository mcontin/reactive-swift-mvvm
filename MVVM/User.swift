//
//  User.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import ObjectMapper
import RealmSwift

class User: Object, Mappable {
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var username = ""
    
    /// Relationships
    let posts = LinkingObjects(fromType: Post.self, property: "author")
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
    }
    
}
