//
//  cache.swift
//  Astronomy
//
//  Created by Kenny on 2/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    private var stores = [Key: Value]()
    private let queue = DispatchQueue(label: "CacheQueue")
    func cache(value: Value, for key: Key) {
        queue.sync {
            self.stores[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        queue.sync {
            return self.stores[key] ?? nil
        }
    }
}
