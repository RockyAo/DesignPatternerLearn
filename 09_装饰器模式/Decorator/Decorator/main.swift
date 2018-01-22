//
//  main.swift
//  Decorator
//
//  Created by Rocky on 2018/1/22.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let account = CustomerAccount(name: "Joe")

account.addPurchase(Purchase(product: "Red Hat", price: 10.0))
account.addPurchase(Purchase(product: "Scarf", price: 20))

account.printAccount()
