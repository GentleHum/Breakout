//
//  BreakoutGameView.swift
//  Breakout
//
//  Created by Mike Vork on 1/8/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BreakoutGameView: NamedBezierPathsView, UIDynamicAnimatorDelegate {

    private struct GameLayout {
        static let brickSeparatorWidth = 3
        static let brickSeparatorHeight = 3
        static let brickHeight = 20
        static let paddleSize = CGSize(width: 50, height: 8)
    }
    
    private struct PathNames {
        static let paddleBarrier = "PaddleBarrier"
    }
    
    private lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
    }
    
    private var bricks = [Array<BrickView>]()
    
    private let brickBehavior = BrickBehavior()
    private let breakoutBehavior = BreakoutBehavior()

    private var paddlePath = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: GameLayout.paddleSize))
    private var paddleLocation = CGPoint.zero
    
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
        let gesturePoint = recognizer.translation(in: self)
        switch recognizer.state {
        case .changed, .ended:
            paddleLocation.x += gesturePoint.x
            paddlePath = UIBezierPath(rect: CGRect(origin: paddleLocation, size: GameLayout.paddleSize))
            bezierPaths[PathNames.paddleBarrier] = paddlePath
            breakoutBehavior.addBarrier(path: self.paddlePath, named: PathNames.paddleBarrier)
            recognizer.setTranslation(CGPoint.zero, in: self)
        default:
            break
        }
 
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutBricks()
        paddleLocation = CGPoint(x: bounds.midX - (GameLayout.paddleSize.width / 2.0), y: bounds.maxY - 30)
        print("layoutSubviews: paddleLocation: \(paddleLocation.x), \(paddleLocation.y)") // zap
        print("layoutSubviews: bounds: \(bounds)")  // zap
        paddlePath = UIBezierPath(rect: CGRect(origin: paddleLocation, size: GameLayout.paddleSize))
        bezierPaths[PathNames.paddleBarrier] = paddlePath
        breakoutBehavior.addBarrier(path: paddlePath, named: PathNames.paddleBarrier)
    }
    

    
    func layoutBricks() {
        print("layoutBricks: \(bricks.count)")  // zap
        print("bounds: width: \(bounds.size.width); height: \(bounds.size.height)") // zap
        
        let brickWidth = ((Int(bounds.size.width) - GameLayout.brickSeparatorWidth) / PropertySettings.numberOfBricksPerRow) - GameLayout.brickSeparatorWidth
        print("brickWidth: \(brickWidth)") // zap
        
        let brickSize = CGSize(width: brickWidth, height: GameLayout.brickHeight)
        var brickFrame = CGRect(origin: CGPoint.zero, size: brickSize)
        
        for rowNumber in 0..<bricks.count {
            brickFrame.origin.x = CGFloat(GameLayout.brickSeparatorWidth) // back to beginning of row
            let brickRow = bricks[rowNumber]
            for brickNumber in 0..<brickRow.count {
                let brick = brickRow[brickNumber]
                brick.frame = brickFrame
                addSubview(brick)
                brickFrame.origin.x += CGFloat(brickWidth + GameLayout.brickSeparatorWidth)
            }
            brickFrame.origin.y += CGFloat(GameLayout.brickHeight + GameLayout.brickSeparatorHeight)
        }
    }
    
    func addBrick(at frame: CGRect, color: UIColor) {
        let brick = BrickView(frame: frame)
        brick.backgroundColor = color
        addSubview(brick)
    }
    
    func addBricks(numberOfRows: Int, numberOfBricksPerRow: Int) {
        bricks.removeAll()
        for _ in 0..<numberOfRows {
            var brickRow = Array<BrickView>()
            for brickNumber in 0..<numberOfBricksPerRow {
                let brick = BrickView(frame: frame)
                brick.backgroundColor = ((brickNumber % 2) == 0) ? UIColor.red : UIColor.blue
                brickRow.append(brick)
            }
            bricks.append(brickRow)
        }
        
    }

}
