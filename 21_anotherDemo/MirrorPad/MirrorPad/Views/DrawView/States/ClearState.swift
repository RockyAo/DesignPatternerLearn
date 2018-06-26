//
//  ClearState.swift
//  MirrorPad
//
//  Created by Rocky on 2018/6/26.
//  Copyright © 2018年 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class ClearState: DrawViewState {
    public override func clear() {
        drawView.lines.removeAll(keepingCapacity: false)
        drawView.layer.sublayers?.removeAll()
        transitionToState(matching: AcceptInputState.identifier)
    }
}
