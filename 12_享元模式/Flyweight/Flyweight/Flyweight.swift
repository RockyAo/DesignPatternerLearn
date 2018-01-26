//
//  Flyweight.swift
//  Flyweight
//
//  Created by Rocky on 2018/1/26.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

protocol Flyweight {
    subscript(key:Coordinate) -> Int? { get set }
    var total:Int { get }
    var count:Int { get }
}

extension Dictionary{
    init(setupFunc:()->[(Key,Value)]) {
        self.init()
        setupFunc().forEach { (item) in
            self[item.0] = item.1
        }
    }
}

class FlyweightFactory {
    class func createFlyweight() -> Flyweight{
     
        return FlyweightImplementation(extrinsic: extrinsicData)
    }
    
    private class var extrinsicData:[Coordinate:Cell] {
        get{
            
            struct singletonWrapper {
                static let singletonData = Dictionary<Coordinate,Cell>(setupFunc:{
                    var  results = [(Coordinate,Cell)]()
                    let letters:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    var stringIndex = letters.startIndex
                    let row = 50
                    repeat {
                        let colLetter = letters[stringIndex]
                        for rowIndex in 1...row{
                            let cell = Cell(col: colLetter, row: rowIndex, val: rowIndex)
                            results.append((cell.coordinate,cell))
                        }
                    } while stringIndex != letters.endIndex
                    
                    return results
                })
            }
            
            return singletonWrapper.singletonData
        }

    }
}

class FlyweightImplementation: Flyweight {
    
    private let extrinsicData:[Coordinate : Cell]
    private var intrinsicData:[Coordinate : Cell]
    private let queue:DispatchQueue
    fileprivate init(extrinsic: [Coordinate: Cell]) {
        self.extrinsicData = extrinsic
        self.intrinsicData = Dictionary<Coordinate,Cell>()
        self.queue = DispatchQueue(label: "dataQ", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
    }
    
    subscript(key: Coordinate) -> Int? {
        get {
            var result:Int?
            
            queue.sync {
                if let cell = intrinsicData[key] {
                    result = cell.value
                }else{
                    result = extrinsicData[key]?.value
                }
            }
            
            return result
        }
        
        set (value) {
            
            if let value = value {
                queue.sync(flags: DispatchWorkItemFlags.barrier, execute: {
                    intrinsicData[key] = Cell(col: key.col, row: key.row, val: value)
                })
            }
        }
    }
    
    var total: Int {
        
        var result = 0
        
        queue.sync {
            result = extrinsicData.values.reduce(0, { (total, cell)  in
                if let intrinsCell = self.intrinsicData[cell.coordinate] {
                    return total + intrinsCell.value
                }else{
                    return total + cell.value
                }
            })
        }
        
        return result
    }
    
    var count: Int {
        var result = 0
        queue.sync {
            result = intrinsicData.count
        }
        return result
    }
    
}



