//
//  NamedBezierPathsView.swift
//  Breakout
//
//  Created by Mike Vork on 1/15/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class NamedBezierPathsView: UIView {
    var bezierPaths = [String: UIBezierPath]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }
}
