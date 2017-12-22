//
//  Book.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Book {
    let author:String
    let title:String
    let stockNumber:Int
    var reader:String?
    var checkoutCount = 0
    
    init(author:String,title:String,stock:Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
}
