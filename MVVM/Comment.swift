//
//  Comment.swift
//  MVVM
//
//  Created by Mattia on 27/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import UIKit
import RealmSwift

class Comment: Object {
    
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
    
}
