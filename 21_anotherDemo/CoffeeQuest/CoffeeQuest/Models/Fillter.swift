//
//  Fillter.swift
//  CoffeeQuest
//
//  Created by Rocky on 2018/6/20.
//  Copyright © 2018年 Jay Strawn. All rights reserved.
//

import Foundation

public struct Fillter {
  public let fillter: (Business) -> Bool
  public var businesses: [Business]
  
  public static func identity() -> Fillter {
    return Fillter(fillter: { _ in return true }, businesses: [])
  }
  
  public static func starRating(atLeast starRating: Double) -> Fillter {
    return Fillter(fillter: { $0.rating >= starRating }, businesses: [])
  }
  
  public func filterBusinesses() -> [Business] {
    return businesses.filter(fillter)
  }
}

extension Fillter: Sequence {
  public func makeIterator() -> IndexingIterator<[Business]> {
      return filterBusinesses().makeIterator()
  }
}
