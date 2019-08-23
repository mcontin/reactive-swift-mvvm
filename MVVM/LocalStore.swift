//
//  LocalStore.swift
//  MVVM
//
//  Created by Mattia on 13/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import RealmSwift

class LocalStore {
    
    private static let schemaVersion = 1
    
    static func save<T: Object>(object: T) {
        let realm = Realm.unsafeGet()
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch let error {
            print("Error in LocalStore.save(object:):", error)
        }
    }
    
    static func save<T: Object>(objects: [T]) {
        let realm = Realm.unsafeGet()
        do {
            try realm.write {
                realm.add(objects, update: .modified)
            }
        } catch let error {
            print("Error in LocalStore.save(objects:):", error)
        }
    }
    
    static func getObject<T: Object, KeyType>(type: T.Type, for primaryKey: KeyType) -> T? {
        return Realm.safeGet()?.object(ofType: type, forPrimaryKey: primaryKey)
    }
    
    static func getObjects<T: Object>(ofType: T.Type) -> [T] {
        guard let realm = Realm.safeGet() else {
            return []
        }
        return realm.objects(T.self).array
    }
    
}
