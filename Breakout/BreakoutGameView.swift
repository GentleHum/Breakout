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
    
//    private let dropBehavior = FallingObjectBehavior()
    
    public var animating: Bool = false {
        didSet {
            if animating {
//                animator.addBehavior(dropBehavior)
            } else {
//                animator.removeBehavior(dropBehavior)
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
}
