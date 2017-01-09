//
//  BreakoutGameView.swift
//  Breakout
//
//  Created by Mike Vork on 1/8/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BreakoutGameView: UIView, UIDynamicAnimatorDelegate {

    private struct GameLayout {
        static let brickSeparatorWidth = 3
        static let brickSeparatorHeight = 3
        static let brickHeight = 12
    }
    
    private lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
    }
    
    private let brickBehavior = BrickBehavior()
    
    public var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(brickBehavior)
            } else {
                animator.removeBehavior(brickBehavior)
            }
        }
    }
    
    func randomBallMovement() {
        
    }
    
    func movePaddle(_ recognizer: UIPanGestureRecognizer) {
/* zap
        let gesturePoint = recognizer.location(in: self)
        switch recognizer.state {
        case .began:
            if let dropToAttachTo = lastDrop, dropToAttachTo.superview != nil {
                attachment = UIAttachmentBehavior(item: dropToAttachTo, attachedToAnchor: gesturePoint)
            }
            lastDrop = nil
        case .changed:
            attachment?.anchorPoint = gesturePoint
        default:
            break
        }
 */
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("subviews.count: \(subviews.count)")  // zap
    }
    
    func addBricks(numberOfRows: Int, numberOfBricksPerRow: Int) {
        print("adding bricks: rows: \(numberOfRows), bricksPerRow: \(numberOfBricksPerRow)")  // zap
        
        print("bounds: width: \(bounds.width); height: \(bounds.height)") // zap
        print("frame.width: \(frame.width)")  // zap
        
        let brickWidth = ((Int(bounds.width) - GameLayout.brickSeparatorWidth) / numberOfBricksPerRow) - GameLayout.brickSeparatorWidth
        print("brickWidth: \(brickWidth)") // zap
        
        
        let brickSize = CGSize(width: brickWidth, height: GameLayout.brickHeight)
        var brickFrame = CGRect(origin: CGPoint.zero, size: brickSize)
        
        for _ in 0..<numberOfRows {
            brickFrame.origin.x = CGFloat(GameLayout.brickSeparatorWidth) // back to beginning of row
            for brickNum in 0..<numberOfBricksPerRow {
                let brick = BrickView(frame: brickFrame)
                brick.backgroundColor = ((brickNum % 2) == 0) ? UIColor.red : UIColor.blue
                
                print("adding brick to frame: x: \(brickFrame.origin.x); y: \(brickFrame.origin.y)")  // zap
                addSubview(brick)
                //        brickBehavior.addItem(brick)
                brickFrame.origin.x += CGFloat(brickWidth + GameLayout.brickSeparatorWidth)
            }
            brickFrame.origin.y += CGFloat(GameLayout.brickHeight + GameLayout.brickSeparatorHeight)
        }
        
        
    }

}
