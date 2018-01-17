//
//  ChangeRecord.swift
//  SportsStore
//
//  Created by Rocky on 2017/12/28.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class ChangeRecord : CustomStringConvertible{
    
    private let outerTag:String
    private let productName:String
    private let catName:String
    private let innerTag:String
    private let value:String
    
    fileprivate init(outer:String,name:String,category:String,inner:String,value:String) {
        self.outerTag = outer
        self.productName = name
        self.catName = category
        self.innerTag = inner
        self.value = value
    }

    var description: String {
        return """
            <\(outerTag)><\(innerTag) name="\(productName)" category="\(catName)>\(value)</\(innerTag)></\(outerTag)>"
        """
        
    }
    
}


class ChangeRecordBuilder {
    var outerTag:String
    var innerTag:String
    var productName:String?
    var category:String?
    var value:String?
    init() {
        outerTag = "change"
        innerTag = "product"
    }
    
    var changeRecord:ChangeRecord?{
        get{
            if let proName = productName,
                let cateName = category,
                let value = value{
                
                return ChangeRecord(outer: outerTag, name: proName, category: cateName, inner: innerTag, value: value)
            }
            
            return nil
        }
    }
    
}
