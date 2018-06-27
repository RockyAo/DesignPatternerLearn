//
//  ShareFacade.swift
//  MirrorPad
//
//  Created by Yun Ao on 2018/6/27.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import Foundation
import UIKit

public class ShareFacade {
    public unowned var entireDrawing: UIView
    public unowned var inputDrawing: UIView
    public unowned var parentViewController: UIViewController
    
    private var imageRenderer = ImageRenderer()
    
    public init(entireDrawing: UIView,
                inputDrawing: UIView,
                parentViewController: UIViewController) {
        self.entireDrawing = entireDrawing
        self.inputDrawing = inputDrawing
        self.parentViewController = parentViewController
    }
    
    public func presentShareController() {
        let selectionViewController = DrawingSelectionViewController.createInstance(entireDrawing: entireDrawing,
                                                                                    inputDrawing: inputDrawing,
                                                                                    delegate: self)
        parentViewController.present(selectionViewController, animated: true, completion: nil)
    }
}

extension ShareFacade: DrawingSelectionViewControllerDelegate {
    public func drawingSelectionViewControllerDidCancel(_ viewController: DrawingSelectionViewController) {
        parentViewController.dismiss(animated: true, completion: nil)
    }
    
    public func drawingSelectionViewController(_ viewController: DrawingSelectionViewController, didSelectView view: UIView) {
        parentViewController.dismiss(animated: true, completion: nil)
        let image = imageRenderer.convertViewToImage(view)
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        parentViewController.present(activityViewController, animated: true, completion: nil)
    }
}
