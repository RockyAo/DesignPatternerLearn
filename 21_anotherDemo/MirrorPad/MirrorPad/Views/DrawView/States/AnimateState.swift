//
//  AnimateState.swift
//  MirrorPad
//
//  Created by Rocky on 2018/6/26.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class AnimateState: DrawViewState {
    public override func animate() {
        guard let sublayers = drawView.layer.sublayers, sublayers.count > 0 else {
            // 1
            transitionToState(
                matching: AcceptInputState.identifier)
            return
        }
        sublayers.forEach { $0.removeAllAnimations() }
        UIView.beginAnimations(nil, context: nil)
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            // 2
            self?.transitionToState(
                matching: AcceptInputState.identifier)
        }
        setSublayersStrokeEnd(to: 0.0)
        animateStrokeEnds(of: sublayers, at: 0)
        CATransaction.commit()
        UIView.commitAnimations()
    }
    
    private func setSublayersStrokeEnd(to value: CGFloat) {
        drawView.layer.sublayers?.forEach {
            guard let shapeLayer = $0 as? CAShapeLayer else { return }
            shapeLayer.strokeEnd = 0.0
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = value
            animation.toValue = value
            animation.fillMode = kCAFillModeForwards
            shapeLayer.add(animation, forKey: nil)
        }
    }
    
    private func animateStrokeEnds(of layers: [CALayer], at index: Int) {
        guard index < layers.count else { return }
        let currentLayer = layers[index]
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            currentLayer.removeAllAnimations()
            self?.animateStrokeEnds(of: layers, at: index + 1)
        }
        if let shapeLayer = currentLayer as? CAShapeLayer {
            shapeLayer.strokeEnd = 1.0
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 1.0
            animation.fillMode = kCAFillModeForwards
            animation.fromValue = 0.0
            animation.toValue = 1.0
            shapeLayer.add(animation, forKey: nil)
        }
        CATransaction.commit()
    }
    
}
