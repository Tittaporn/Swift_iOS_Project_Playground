//
//  Event.swift
//  MVVM_Example
//
//  Created by M3ts LLC on 6/22/22.
//

import Foundation

class Event<T> {
    let identifier: String
    let result: Result<T, Error>?
    
    init(identifier: String, result: Result<T, Error>?) {
        self.identifier = identifier
        self.result = result
    }
}

// Sub - Class of Events
class UserFetchEvent: Event<[User]> {
    let created = Date()
}
