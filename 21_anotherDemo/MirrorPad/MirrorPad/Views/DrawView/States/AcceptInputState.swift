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
        drawView.lines.append(line)
        drawView.layer.addSublayer(line)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: drawView),
            let currentLine = drawView.lines.last  else { return  }
        currentLine.addPoint(point)
    }
}
