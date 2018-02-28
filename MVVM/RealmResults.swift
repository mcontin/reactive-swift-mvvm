//
//  RealmResults.swift
//  MVVM
//
//  Created by Mattia on 28/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import RealmSwift

extension Results {
    
    var array: [Element] {
        return Array(self)
    }
    
}
