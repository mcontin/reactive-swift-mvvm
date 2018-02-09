//
//  Realm.swift
//  MVVM
//
//  Created by Mattia on 02/10/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import RealmSwift

extension Realm {
    
    static func safeGet() -> Realm? {
        do {
            let a = try Realm()
            return a
        } catch let error {
            debugPrint(error)
        }

        return nil
    }
    
    static func unsafeGet() -> Realm {
        return try! Realm()
    }
    
}
