//
//  Logger.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Logger<T> where T:NSCopying {
    
    var dataItems:[T] = []
    
    var callBack:(T)->Void
    
    init(callBack:@escaping (T)->Void) {
        self.callBack = callBack
    }
    
    func logItem(_ item:T)  {
        dataItems.append(item.copy() as! T)
        callBack(item)
    }
    
    func processItems(callBack:(T)->Void) {
        for item in dataItems{
            callBack(item)
        }
    }
}
