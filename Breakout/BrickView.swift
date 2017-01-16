//
//  BrickView.swift
//  Breakout
//
//  Created by Mike Vork on 1/6/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BrickView: UIView {
    
    // public variables
    var color = UIColor.blue { didSet { setNeedsDisplay(); updateUI() } }
    var hitCount = 1 { didSet { setNeedsDisplay(); updateUI() } }  // hits remaining to destroy the brick
    var hitsToDestroy = 1 { didSet { setNeedsDisplay(); hitCount = hitsToDestroy; updateUI() } }
    
    func processHit() {
        if hitCount > 0 {
            hitCount -= 1
        }
    }
    
    private func updateUI() {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        print("updateUI: hitsToDestroy: \(hitsToDestroy); hitCount: \(hitCount)")  // zap
        let alphaPercent = 1.0 - (Float(hitsToDestroy - hitCount) / Float(hitsToDestroy))
        print("updateUI: alphaPercent: \(alphaPercent)")  // zap
        
        backgroundColor = UIColor(colorLiteralRed: Float(red), green: Float(green), blue: Float(blue), alpha: alphaPercent)
        print("updateUI: backgroundColor: \(backgroundColor)")  // zap
    }
    

}
