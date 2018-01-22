//
//  CustomerAccount.swift
//  Decorator
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class CustomerAccount {
    let customerName:String
    var purchases:[Purchase] = []
    
    init(name:String) {
        self.customerName = name
    }
    
    func addPurchase(_ purchase:Purchase)  {
        self.purchases.append(purchase)
    }
    
    func printAccount()  {
        var total:Float = 0
        purchases.forEach { (p) in
            total += p.totalPrice
            print("Purchase \(p),Price \(formatCurrency(number: p.totalPrice))")
        }
        print("Total due: \(formatCurrency(number: total))")
    }
    
    func formatCurrency(number:Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
