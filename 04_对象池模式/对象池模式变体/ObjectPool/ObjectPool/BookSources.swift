//
//  BookSeller.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/22.
//  Copyright © 2017年 Rocky. All rights reserved.
//  这个实现不重要  只是为提供获取Book实例的方法

import Foundation

class BookSeller {
    class func buyBook(author:String,title:String,stockNumber:Int) -> Book{
        return Book(author: author, title: title, stock: stockNumber)
    }
}

class LibraryNetwork {
    class func borrowBook(author:String,title:String,stockNumber:Int) -> Book{
        return Book(author: author, title:title, stock: stockNumber)
    }
    class func returnBook(_ book:Book){
        // do nothing
    }
}
