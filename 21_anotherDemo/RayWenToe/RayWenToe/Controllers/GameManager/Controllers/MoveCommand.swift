//
//  MoveCommand.swift
//  RayWenToe
//
//  Created by Yun Ao on 2018/6/28.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import Foundation

public struct MoveCommand {
  public var gameboard: Gameboard
  public var gameboardView: GameboardView
  public var player: Player
  public var position: GameboardPosition
  
  public func excute(completion: (() -> Void)? = nil) {
      gameboard.setPlayer(player, at: position)
      gameboardView.placeMarkView(player.markViewPrototype.copy(), at: position, animated: true, completion: completion)
  }
}
