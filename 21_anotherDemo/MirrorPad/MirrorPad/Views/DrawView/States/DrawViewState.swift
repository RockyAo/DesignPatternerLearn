//
//  DrawViewState.swift
//  MirrorPad
//
//  Created by Rocky on 2018/6/26.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class DrawViewState {
    
    public class var identifier: AnyHashable {
        return ObjectIdentifier(self)
    }
    
    public unowned let drawView: DrawView
    

    public init(drawView: DrawView) {
        self.drawView = drawView
        
    }
    
    
    public func animate() { }
    public func copyLines(from source: DrawView) {}
    public func clear() {}
    public func touchBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}
    public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    @discardableResult internal func transitionToState(matching identifier: AnyHashable) -> DrawViewState {
        let state = drawView.states[identifier]!
        drawView.currentState = state
        return state
    }
}

extension DrawViewState: DrawViewDelegate {
    public func drawView(_ source: DrawView, didAddLine line: LineShape) {
        
    }
    
    public func drawView(_ source: DrawView, didAddPoint point: CGPoint) {
        
    }
}
