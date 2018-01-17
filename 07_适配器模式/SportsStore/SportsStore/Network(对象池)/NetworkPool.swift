//
//  NetworkPool.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/22.
//  Copyright © 2017年 Rocky. All rights reserved.
//  对象池模式演示

import Foundation

final class NetworkPool {
    
    static let shared:NetworkPool = NetworkPool()
    
    private let connectionCount = 3
    private var connections:[NetworkConnect] = []
    private var semaphore:DispatchSemaphore
    private var queue:DispatchQueue
    
    private init(){
        for _ in 0..<connectionCount{
            connections.append(NetworkConnect())
        }
        semaphore = DispatchSemaphore(value: connectionCount)
        queue = DispatchQueue(label: "networkpool")
    }
    
    func doGetConnection() -> NetworkConnect {
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        var result:NetworkConnect!
        queue.sync {
            result = self.connections.removeFirst()
        }
        return result
    }
    
    func returnConnection(_ connection:NetworkConnect) {
        queue.async {
            self.connections.append(connection)
        }
        semaphore.signal()
    }
}
