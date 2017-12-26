//
//  Logger.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//  单例模式

import Foundation

final class Logger {
    
    static let shared:Logger = Logger(callBack: { (item:Product) in
        print("change \(item.name) \(item.stockLevel) items in stock")
    })
    
    private var dataItems:[Product] = []
    
    private var callBack:(Product)->Void
    
    private let arrayQ = DispatchQueue(label: "arrayQ", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
    
    private let callBackQ = DispatchQueue(label: "callBackQ")
    
    init(callBack:@escaping (Product)->Void,protect:Bool = true) {
        self.callBack = callBack
        
        if protect {
            self.callBack = { (item:Product) in
                self.callBackQ.sync {
                    callBack(item)
                }
            }
        }
    }
    
    func logItem(_ item:Product)  {
        
        let workItem = DispatchWorkItem(qos: DispatchQoS.default, flags: .barrier) {
            self.dataItems.append(item.copy() as! Product)
            self.callBack(item)
        }
        
        arrayQ.async(execute: workItem)
    }
    
    func processItems(callBack:(Product)->Void) {
        arrayQ.sync {
            for item in dataItems{
                callBack(item)
            }
        }
    }
}
