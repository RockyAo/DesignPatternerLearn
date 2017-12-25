//
//  Library.swift
//  ObjectPool
//
//  Created by Rocky on 2017/12/21.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class Library{
    
    static let shared:Library = Library(stockLevel: 5)
    
    private var pool:Pool<Book>
    
    private init(stockLevel:Int){
        
        var stockId = 1
        
        stockId += 1
        
        self.pool = Pool(maxItemCount: stockLevel,
                         peakCount: (stockLevel*2),
                         returnCount:(stockLevel/2),
                         itemfactory: { () -> Book in
                            return BookSeller.buyBook(author: "xxxxxx", title: "Hard Times", stockNumber: stockId)
                         },
                         peakFactory: { () -> Book in
                            return LibraryNetwork.borrowBook(author: "xxxxxx", title: "Hard Times", stockNumber: stockId)
                         },
                         reaper: LibraryNetwork.returnBook)
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
        
        pool.processPoolItems { (books) in
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
}
