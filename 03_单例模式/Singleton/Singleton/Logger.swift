//
//  Logger.swift
//  Singleton
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class Logger {
    
    static let shared:Logger = Logger()
    
    private var data:[String] = []
    
    private let arrayQ = DispatchQueue(label: "arrayQ")
    
    private init() { }
    
    func log(msg:String) {
        arrayQ.sync {
            data.append(msg)
        }
    }
    
    func printLog()  {
        data.forEach{
            print("log: \($0)")
        }
    }
}
