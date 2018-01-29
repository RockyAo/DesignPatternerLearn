//
//  main.swift
//  Vistor
//
//  Created by Rocky on 2018/1/29.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let shapes = ShapeCollection()
//let area = shapes.calculateAreas()
//print("Area : \(area)")
let areaVisitor = AreaVisitor()

shapes.accept(visitor: areaVisitor)

print("Arear :\(areaVisitor.totalArea)")

print("--------")

let edgeVisitor = EdgesVisitor()
shapes.accept(visitor: edgeVisitor)

print("Edge :\(edgeVisitor.totalEdges)")
