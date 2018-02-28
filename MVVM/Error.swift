//
//  Error.swift
//  MVVM
//
//  Created by Mattia on 28/02/2018.
//  Copyright © 2018 Mattia. All rights reserved.
//

import Foundation

extension Error {
    
    /// Return this as NSError
    public var nsError: NSError {
        return self as NSError
    }
    
    /// Returns the NSError code
    public var code: Int {
        return nsError.code
    }
    
    /// Returns the NSError message
    public var message: String {
        return nsError.localizedDescription
    }
    
}

extension NSError {
    
    /// Helper function to build errors with custom messages more easily
    public static func with(message: String, code: Int = -1) -> NSError {
        return NSError(domain: Bundle.main.bundleIdentifier ?? "co.mc",
                       code: code,
                       userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
