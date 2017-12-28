//
//  BurgerBuilder.swift
//  Builder
//
//  Created by Rocky on 2017/12/27.
//  Copyright © 2017年 Rocky. All rights reserved.
//

import Foundation

final class BurgerBuilder {
    private var veggie:Bool = false
    private var pickles:Bool = false
    private var mayo:Bool = true
    private var ketchup:Bool = true
    private var lettuce:Bool = true
    private var cooked:Burger.Cooked = .normal
    private var patties:Int = 2
    
    func setVeggie(_ choice:Bool) -> BurgerBuilder{
        veggie = choice
        return self
    }
    
    func setPickles(_ choice:Bool) -> BurgerBuilder {
        pickles = choice
        return self
    }
    
    func setMayo(_ choice:Bool) -> BurgerBuilder {
        mayo = choice
        return self
    }
    
    func setKetchup(_ choice:Bool) -> BurgerBuilder {
        ketchup = choice
        return self
    }
    
    func setLettuce(_ choice:Bool) -> BurgerBuilder {
        lettuce = choice
        return self
    }
    
    func setCooked(_ choice:Burger.Cooked) -> BurgerBuilder {
        cooked = choice
        return self
    }
    
    func addPatty(_ choice:Bool) -> BurgerBuilder {
        patties = choice ? 3 : 2
        return self
    }
    
    func buildBurgerObject(name:String) -> Burger {
        return Burger(name: name, veggie: veggie, patties: patties, pickles: pickles, mayo: mayo,
                      ketchup: ketchup, lettuce: lettuce, cook: cooked)
    }
}
