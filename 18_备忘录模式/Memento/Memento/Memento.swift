//
//  Memento.swift
//  Memento
//
//  Created by Rocky on 2018/1/28.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Foundation
protocol Memento {}

protocol Originator {
    func createMemento() -> Memento
    func applyMemento(_ memento:Memento)
}
