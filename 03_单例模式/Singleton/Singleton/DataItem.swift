//
//  DataItem.swift
//  Singleton
//
//  Created by Rocky on 2017/12/19.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class DataItem {
    enum ItemType : String {
        case email = "Email address"
        case phone = "Telephone number"
        case card = "Credit Card Number"
    }
    
    var type:ItemType
    
    var data:String
    
    init(type:ItemType,data:String) {
        self.type = type
        self.data = data
    }
    
}
