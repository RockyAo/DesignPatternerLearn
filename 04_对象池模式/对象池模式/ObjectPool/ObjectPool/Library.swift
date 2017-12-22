//
//  Library.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class Library{
    
    static let shared:Library = Library(stockLevel: 2)
    
    private var books:[Book] = []
    private var pool:Pool<Book>
    
    private init(stockLevel:Int){
        for count in 1...stockLevel {
            let book = Book(author: "xxxx", title: "Design Pattern in Swift", stock: count)
            books.append(book)
        }
        
        self.pool = Pool(items: books)
    }
    
    func checkoutBook(reader:String) -> Book? {
        let book = pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    func returnBook(_ book:Book) {
        book.reader = nil
        pool.returnPool(item: book)
    }
    
    func printReport() {
        books.forEach { (book) in
            print("....Book#\(book.stockNumber)....")
            print("Checked out to \(book.checkoutCount) times ")
            if let reader = book.reader{
                print("Checked out to \(reader)")
            }else{
                print("in stock")
            }
        }
    }
}
