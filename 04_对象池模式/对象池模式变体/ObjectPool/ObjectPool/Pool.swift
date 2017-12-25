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
    
    private var ejectedItems:Int = 0
    private var poolExhausted:Bool = false
    
    init(maxItemCount:Int,factory:@escaping ()->T) {
        self.itemFactory = factory
        self.maxItemCount = maxItemCount
        self.semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func getFromPool(maxWaitSecond:Int = 5) -> T? {
        
        var result:T?
        
        let waitTime = (maxWaitSecond == -1) ? DispatchTime.distantFuture : DispatchTime(uptimeNanoseconds: UInt64(maxWaitSecond*Int(NSEC_PER_SEC)))
        
        
        if !poolExhausted {
            if semaphore.wait(timeout: waitTime) == .success{
                if !poolExhausted{
                    dataProtectQueue.sync {
                        if self.data.count == 0 && self.itemCount < self.maxItemCount{
                            result = self.itemFactory()
                            self.itemCount += 1
                        }else{
                            result = self.data.removeFirst()
                        }
                    }
                }
            }
        }
        
        return result
    }
    
    func returnPool(item:T) {
        dataProtectQueue.async {
            ///对归还对象进行检查
            if let pitem = item as? PoolItem {
                if pitem.canReuse {
                    self.data.append(item)
                    self.semaphore.signal()
                }else{
                    self.ejectedItems += 1
                    if self.ejectedItems == self.maxItemCount{
                        self.poolExhausted = true
                        self.flushQueue()
                    }
                }
                
            }
           
        }
    }
    
    func processPoolItems(callBack:(([T]) -> Void)) {
        dataProtectQueue.sync {
            callBack(self.data)
        }
    }
    
    private func flushQueue(){
        let dQueue = DispatchQueue(label: "dQueue", qos: DispatchQoS.default, attributes: .concurrent)
        var backlogCleared = false
        
        dQueue.async {
            _ = self.semaphore.wait(timeout: DispatchTime.distantFuture)
            backlogCleared = true
        }
        
        dQueue.async {
            while !backlogCleared {
                self.semaphore.signal()
            }
        }
    }
}
