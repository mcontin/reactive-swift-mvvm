//
//  Optional.swift
//  MVVM
//
//  Created by Mattia on 24/09/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

extension Optional {
    /// Calls the passed closure on its Wrapped value if it's not nil and then returns self
    
    /// Usage:
    /// yourNullableVar.getAs { this in
    ///     print("\(this) is not nil!")
    /// }
    @discardableResult
    func getAs(_ run: (Wrapped) -> Void) -> Optional {
        if let unwrappedSelf = self {
            run(unwrappedSelf)
        }
        return self // return self even if nil to allow chaining of future extensions
    }
    
    func ifNil(_ run: () -> Void) {
        if self == nil {
            run()
        }
    }
    
}
