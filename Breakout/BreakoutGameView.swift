//
//  BreakoutGameView.swift
//  Breakout
//
//  Created by Mike Vork on 1/8/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BreakoutGameView: UIView, UIDynamicAnimatorDelegate {

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
        
        addBricks()
    }
    
    func addBricks() {
        print("adding bricks")
        let brickSize = CGSize(width: 20, height: 12)
        let frame = CGRect(origin: CGPoint.zero, size: brickSize)
//        frame.origin.x = CGFloat.random(max: dropsPerRow) * dropSize.width
        
        let brick = BrickView(frame: frame)
        brick.backgroundColor = UIColor.random
        
        addSubview(brick)
//        brickBehavior.addItem(brick)
    }

}
