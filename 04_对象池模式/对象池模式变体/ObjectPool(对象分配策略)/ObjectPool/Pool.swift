//
//  Pool.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Pool<T> where T:AnyObject {
    private var data:[T] = []
    
    private let dataProtectQueue = DispatchQueue(label: "com.ra.ObjectPool.Pool.DataProtectQueue")
    
    private let semaphore:DispatchSemaphore
    
    private var itemCount:Int = 0
    private let maxItemCount:Int
    private let itemFactory:()->T
    private let itemAllocator:([T])->Int
    private var createdCount:Int = 0
    
    init(maxItemCount:Int,factory:@escaping ()->T,itemAllocator:@escaping (([T]) -> Int)) {
        self.itemFactory = factory
        self.maxItemCount = maxItemCount
        self.semaphore = DispatchSemaphore(value: maxItemCount)
        self.itemAllocator = itemAllocator
    }
    
    func getFromPool(maxWaitSecond:Int = 5) -> T? {
        
        var result:T?
    
        if semaphore.wait(timeout: DispatchTime.distantFuture) == .success{
            
            dataProtectQueue.sync {
                if self.data.count == 0{
                    result = self.itemFactory()
                    self.itemCount += 1
                }else{
                    result = self.data.remove(at: itemAllocator(self.data))
                }
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
    
    func processPoolItems(callBack:(([T]) -> Void)) {
        dataProtectQueue.sync {
            callBack(self.data)
        }
    }
    
}
