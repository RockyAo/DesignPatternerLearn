//
//  CopyState.swift
//  MirrorPad
//
//  Created by Rocky on 2018/6/26.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class CopyState: DrawViewState {
    public override func copyLines(from source: DrawView) {
        drawView.layer.sublayers?.removeAll()
        drawView.lines = source.lines.deepCopy()
        drawView.lines.forEach { drawView.layer.addSublayer($0) }
        transitionToState(matching: AcceptInputState.identifier)
    }
}
