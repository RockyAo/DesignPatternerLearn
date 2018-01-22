//
//  Euro.swift
//  SportsStore
//
//  Created by Rocky on 2018/1/17.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class EuroHandler {
    func getDisplayString(amount:Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: amount)
        return "€ \(formatted.dropFirst())"
    }
    func getCurrencyAmount(_ amount:Double) -> Double {
        return 0.76164 * amount
    }
}
