//
//  BrickBehavior.swift
//  Breakout
//
//  Created by Mike Vork on 1/8/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class BrickBehavior: UIDynamicBehavior {
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    private let itemBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = true
        dib.elasticity = 0.75
        return dib
    }()
        
    
    override init() {
        super.init()
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)
    }
    
    func addItem(_ item: UIDynamicItem) {
        collider.addItem(item)
        itemBehavior.addItem(item)
    }
    
    func removeItem(_ item: UIDynamicItem) {
        collider.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
}
