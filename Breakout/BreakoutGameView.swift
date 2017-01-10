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
        static let brickHeight = 20
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
        print("bounds: width: \(bounds.size.width); height: \(bounds.size.height)") // zap
        print("frame.width: \(frame.width); frame.height: \(frame.height)")  // zap
        print("center: \(frame.midX)")  // zap
        
        let brickWidth = ((Int(self.bounds.size.width) - GameLayout.brickSeparatorWidth) / numberOfBricksPerRow) - GameLayout.brickSeparatorWidth
        print("brickWidth: \(brickWidth)") // zap
        
        
        let brickSize = CGSize(width: brickWidth, height: GameLayout.brickHeight)
        var brickFrame = CGRect(origin: CGPoint.zero, size: brickSize)
        
        for _ in 0..<numberOfRows {
            brickFrame.origin.x = CGFloat(GameLayout.brickSeparatorWidth) // back to beginning of row
            for brickNum in 0..<numberOfBricksPerRow {
                addBrick(at: brickFrame, color: ((brickNum % 2) == 0) ? UIColor.red : UIColor.blue)
                brickFrame.origin.x += CGFloat(brickWidth + GameLayout.brickSeparatorWidth)
            }
            brickFrame.origin.y += CGFloat(GameLayout.brickHeight + GameLayout.brickSeparatorHeight)
        }
        
    }
    
    func addBrick(at frame: CGRect, color: UIColor) {
        let brick = BrickView(frame: frame)
        brick.backgroundColor = color
        print("adding brick: x: \(frame.origin.x); y: \(frame.origin.y), width: \(frame.width), height: \(frame.height)")  // zap
        
        addSubview(brick)
    }

}
