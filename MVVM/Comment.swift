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
    dynamic var id = 0
    
    /// Properties
    dynamic var name = ""
    dynamic var email = ""
    dynamic var body = ""
    
    /// Relationships
    dynamic var post: Post?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
