//
//  Pool.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Pool<T> {
    private var data:[T] = []
    
    private let dataProtectQueue = DispatchQueue(label: "com.ra.ObjectPool.Pool.DataProtectQueue")
    
    private let semaphore:DispatchSemaphore
    
    
    init(items:[T]) {
        data.reserveCapacity(data.count)
        data.append(contentsOf: items)
        self.semaphore = DispatchSemaphore(value: items.count)
    }
    
    func getFromPool() -> T? {
        
        var result:T?
        
        if semaphore.wait(timeout: DispatchTime.distantFuture) == .success{
            dataProtectQueue.sync {
                result = self.data.remove(at: 0)
            }
        }
        
        return result
    }
    
    func returnPool(item:T) {
        dataProtectQueue.async {
            self.data.append(item)
            self.semaphore.signal()
        }
    }
}
