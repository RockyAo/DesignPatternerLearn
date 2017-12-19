//
//  main.swift
//  Singleton
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation


//
//var server = BackupServer.sharedServer
//server.backup(item: DataItem(type: .email, data: "542622608@qq.com"))
//server.backup(item: DataItem(type: .phone, data: "186xxxx3146"))
//
//Logger.shared.log(msg: "back up 2 items to \(server.name)")
//
//var otherServer = BackupServer.sharedServer
//otherServer.backup(item: DataItem(type: .email, data: "xxxx@gmail.com"))
//
//Logger.shared.log(msg: "back up 1 item to \(otherServer.name)")
//
//Logger.shared.printLog()


///并发测试

let group = DispatchGroup()
let queue = DispatchQueue(label: "workqueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)

for count in 0..<100{
    
    let workItem = DispatchWorkItem(block: {
        BackupServer.sharedServer.backup(item: DataItem(type: .email, data: "test\(count)@example.com"))
    })
    queue.async(group: group, execute: workItem)
}

let result = group.wait(wallTimeout: DispatchWallTime)

switch result{
case .success:
    print("未超时，100个任务全部完成")
    break
case .timedOut:
    print("任务超时")
    break
}

print("\(BackupServer.sharedServer.getData().count) items were back up")
