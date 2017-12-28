//
//  NetworkConnection.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/22.
//  Copyright © 2017年 Rocky. All rights reserved.
//  模拟网络请求，实现对象池模式

import Foundation

class NetworkConnect {
    private let stockData:[String:Int] = [
        "Kayak" : 10, "Lifejacket": 14, "Soccer Ball": 32,"Corner Flags": 1,
        "Stadium": 4, "Thinking Cap": 8, "Unsteady Chair": 3,
        "Human Chess Board": 2, "Bling-Bling King":4
    ]
    
    func getStockLevel(name:String) -> Int? {
        Thread.sleep(forTimeInterval: Double(arc4random() % 2))
        return stockData[name]
    }
}
