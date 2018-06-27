//
//  AcceptInputState.swift
//  MirrorPad
//
//  Created by Rocky on 2018/6/26.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class AcceptInputState: DrawViewState {
    public override func animate() {
        let animateState = transitionToState(matching: AnimateState.identifier)
        animateState.animate()
    }
    
    public override func clear() {
        let clearState = transitionToState(matching: ClearState.identifier)
        clearState.clear()
    }
    
    public override func copyLines(from source: DrawView) {
        let copyState = transitionToState(matching: CopyState.identifier)
        copyState.copyLines(from: source)
    }
    
    public override func touchBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: drawView) else { return }
        
        let line = LineShape(color: drawView.lineColor,
                             width: drawView.lineWidth,
                             startPoint: point)
        
        addLine(line)
        
        drawView.multicastDelegate.invokeDelegates {
            $0.drawView(drawView, didAddLine: line)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: drawView) else { return  }
        
        addPoint(point)
        
        drawView.multicastDelegate.invokeDelegates {
            $0.drawView(drawView, didAddPoint: point)
        }
    }
    
    private func addPoint(_ point: CGPoint) {
        drawView.lines.last?.addPoint(point)
    }
    
    private func addLine(_ line: LineShape) {
        drawView.lines.append(line)
        drawView.layer.addSublayer(line)
    }
}

extension AcceptInputState {
    public override func drawView(_ source: DrawView, didAddPoint point: CGPoint) {
        addPoint(point)
    }
    
    public override func drawView(_ source: DrawView, didAddLine line: LineShape) {
        let newLine = line.copy() as LineShape
        addLine(newLine)
    }
}
