//
//  BrickView.swift
//  Breakout
//
//  Created by Mike Vork on 1/6/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BrickView: UIView {
    
    var width = 20 { didSet { setNeedsDisplay() } }
    var height = 10 { didSet { setNeedsDisplay() } }
    var color = UIColor.blue { didSet { setNeedsDisplay() } }
    var hitCount = 0 { didSet { setNeedsDisplay() } }
    var hitsToDestroy = 1 { didSet { setNeedsDisplay() } }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
