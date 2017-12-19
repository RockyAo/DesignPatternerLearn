//
//  BackupServer.swift
//  Singleton
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class BackupServer {
    
    static let sharedServer:BackupServer = BackupServer(name: "MainBackupServer")
    
    let name:String
    private var data = [DataItem]()
    
    private let arrayQ = DispatchQueue(label: "arrayQ")
    
    private init(name:String) {
        self.name = name
        Logger.shared.log(msg: "Created new server named \(name)")
    }
    
    func backup(item:DataItem) {
        arrayQ.sync {
            self.data.append(item)
            Logger.shared.log(msg: "backed up item of type \(item.type.rawValue)")
        }
    }
    
    func getData() -> [DataItem] {
        return data
    }
}
