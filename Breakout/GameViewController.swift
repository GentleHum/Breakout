//
//  GameViewController.swift
//  Breakout
//
//  Created by Mike Vork on 1/5/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gameView: BreakoutGameView! {
        didSet {
            gameView.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(randomBallMovement(_:))))
            gameView.addGestureRecognizer(
                UIPanGestureRecognizer(target: gameView, action: #selector(BreakoutGameView.movePaddle(_:))))
        }
    }
    
    func randomBallMovement(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            gameView.randomBallMovement()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameView.animating = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        gameView.animating = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("gameView bounds: \(gameView.bounds)") // zap
        gameView.addBricks(numberOfRows: PropertySettings.numberOfBrickRows,
                           numberOfBricksPerRow: PropertySettings.numberOfBricksPerRow)
    }
    
    
}

