//
//  User.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    
    /// Primary key
    @objc dynamic var id = 0
    
    /// Properties
    @objc dynamic var username = ""
    
    /// Relationships
    let posts = LinkingObjects(fromType: Post.self, property: "user")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
