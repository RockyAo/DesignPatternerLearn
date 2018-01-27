//
//  main.swift
//  Mediator
//
//  Created by Rocky on 2018/1/27.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation

let mediator:Mediator = AirplaneMediator()

let british = Airplane(name: "BA706", initialPos: Position(distanceFromRunway: 11, height: 21000), mediator: mediator)

let american = Airplane(name: "AA101", initialPos: Position(distanceFromRunway: 12, height: 22000), mediator: mediator)

british.changePosition(newPosition: Position(distanceFromRunway: 8, height: 10000))
british.changePosition(newPosition: Position(distanceFromRunway: 2, height: 5000))
british.changePosition(newPosition: Position(distanceFromRunway: 1, height: 1000))

let cathay = Airplane(name: "CX200", initialPos: Position(distanceFromRunway: 13, height: 22000), mediator: mediator)

british.land()

cathay.changePosition(newPosition: Position(distanceFromRunway: 12, height: 22000))
