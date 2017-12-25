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
    
    
    private let itemFactory:()->T
    private let peakFactory:()->T
    private let peakReaper:(T)->Void
    
    private var createdCount:Int = 0
    private let normalCount:Int
    private let peakCount:Int
    private let returnCount:Int
    private let waitTime:Int
    private let maxItemCount:Int
    
    init(maxItemCount:Int,
         peakCount:Int,
         returnCount:Int,
         waitTime:Int = 2 ,
         itemfactory:@escaping ()->T,
         peakFactory:@escaping ()->T,
         reaper:@escaping (T)->Void
        ) {
        self.normalCount = maxItemCount
        self.returnCount = returnCount
        self.maxItemCount = maxItemCount
        self.peakCount = peakCount
        self.waitTime = waitTime
        self.itemFactory = itemfactory
        self.peakFactory = peakFactory
        self.peakReaper = reaper
        self.semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func getFromPool(maxWaitSecond:Int = 5) -> T? {
        
        var result:T?
        
        let expiryTime = (maxWaitSecond == -1) ? DispatchTime.distantFuture : DispatchTime(uptimeNanoseconds: UInt64(maxWaitSecond*Int(NSEC_PER_SEC)))
        
        
        if semaphore.wait(timeout: expiryTime) == .success{
            
            dataProtectQueue.sync {
                if self.data.count == 0 {
                    result = self.itemFactory()
                    self.createdCount += 1
                }else{
                    result = self.data.removeFirst()
                }
            }
            
        }else{
            
            dataProtectQueue.sync {
                result = self.peakFactory()
                self.createdCount += 1
            }
        }
        
        
        return result
    }
    
    func returnPool(item:T) {
        dataProtectQueue.async {
           
            if self.data.count > self.returnCount
                && self.createdCount > self.normalCount {
                
                self.peakReaper(item)
                self.createdCount -= 1
            } else {
              
                self.data.append(item)
                self.semaphore.signal()
            }
           
        }
    }
    
    func processPoolItems(callBack:(([T]) -> Void)) {
        dataProtectQueue.sync {
            callBack(self.data)
        }
    }

}
