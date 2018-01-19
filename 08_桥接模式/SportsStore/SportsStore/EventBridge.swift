//
//  EventBridge.swift
//  SportsStore
//
//  Created by Rocky on 2018/1/19.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class EventBridge {
    private let outputCallBack:(String,Int) -> Void
    
    init(callBack:@escaping (String,Int)->Void) {
        self.outputCallBack = callBack
    }
    
    var inputCallBack:(Product) -> Void{
        return { p in self.outputCallBack(p.name,p.stockLevel) }
    }
    
}
