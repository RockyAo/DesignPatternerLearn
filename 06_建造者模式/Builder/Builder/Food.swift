//
//  Food.swift
//  Builder
//
//  Created by Rocky on 2017/12/27.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

class Burger {
    
    enum Cooked:String {
        case rare = "Rare"
        case normal = "Normal"
        case wellDone = "Well Done"
    }
    
    let customerName:String
    let veggieProduct:Bool
    let patties:Int
    let pickles:Bool
    let mayo:Bool
    let ketchup:Bool
    let cook:Cooked
    
    
    init(name:String,veggie:Bool,patties:Int,pickles:Bool,
         mayo:Bool,ketchup:Bool,lettuce:Bool,cook:Cooked) {
        
        self.customerName = name
        self.veggieProduct = veggie
        self.patties = patties
        self.pickles = pickles
        self.mayo = mayo
        self.ketchup = ketchup
        self.cook = cook
    }
    
    func printDescription()  {
        print("Name \(customerName)")
        print("Vegie \(veggieProduct)")
        print("Patties \(patties)")
        print("Pickles \(pickles)")
        print("Mayo \(mayo)")
        print("Ketchup \(ketchup)")
        print("Cook \(cook.rawValue)")
    }
}
