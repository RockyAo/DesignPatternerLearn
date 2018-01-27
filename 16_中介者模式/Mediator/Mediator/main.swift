//
//  main.swift
//  Mediator
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let british = Airplane(name: "BA706", initialPos: Position(distanceFromRunway: 11, height: 21000))

british.changePosition(newPosition: Position(distanceFromRunway: 8, height: 10000))
british.changePosition(newPosition: Position(distanceFromRunway: 2, height: 5000))
british.changePosition(newPosition: Position(distanceFromRunway: 1, height: 1000))
british.land()

