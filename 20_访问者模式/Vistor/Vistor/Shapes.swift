//
//  Shapes.swift
//  Vistor
//
//  Created by Rocky on 2018/1/29.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

class Circle {
   
    let radius:Float
    
    init(radius:Float) {
        self.radius = radius
    }

}

class Square {
    let length:Float
    
    init(length:Float) {
        self.length = length
    }
}

class Reactangle {
    let xlen:Float
    let ylen:Float
    
    init(x:Float,y:Float) {
        self.xlen = x
        self.ylen = y
    }
}

class ShapeCollection {
    let shapes:[Any]
    
    init() {
        shapes = [
            Circle(radius: 2.5),Square(length: 4),Reactangle(x: 10, y: 2)
        ]
    }
    
    func calculateAreas() -> Float {
        return shapes.reduce(0, { (total, shape) in
            if let circle = shape as? Circle{
                print("find Circle")
                return total + (3.14*powf(circle.radius, 2))
            }else if let square = shape as? Square{
                print("find square")
                return total + powf(square.length, 2)
            }else if let react = shape as? Reactangle{
                print("found react")
                return total + (react.xlen * react.ylen)
            }else{
                return total
            }
        })
    }
}
