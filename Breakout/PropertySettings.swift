//
//  PropertySettings.swift
//  Breakout
//
//  Created by Mike Vork on 1/6/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import Foundation

struct PropertySettings {
    
    // constants for field names
    private struct FieldNames {
        static let numberOfBricks = "numberOfBricks"
        static let minimumNumberOfHitsPerBrick = "minimumNumberOfHitsPerBrick"
        static let maximumNumberOfHitsPerBrick = "maximumNumberOfHitsPerBrick"
    }
    
    static var numberOfBricks = 20
    static var minimumNumberOfHitsPerBrick = 1
    static var maximumNumberOfHitsPerBrick = 1
    
    
    // load from NSUserDefaults
    static func load() {
        let defaults = UserDefaults.standard
        numberOfBricks = defaults.integer(forKey: FieldNames.numberOfBricks)
        minimumNumberOfHitsPerBrick = defaults.integer(forKey: FieldNames.minimumNumberOfHitsPerBrick)
        maximumNumberOfHitsPerBrick = defaults.integer(forKey: FieldNames.maximumNumberOfHitsPerBrick)
    }
    
    // store to NSUserDefaults
    static func store() {
        let defaults = UserDefaults.standard
        defaults.set(numberOfBricks, forKey: FieldNames.numberOfBricks)
        defaults.set(minimumNumberOfHitsPerBrick, forKey: FieldNames.minimumNumberOfHitsPerBrick)
        defaults.set(maximumNumberOfHitsPerBrick, forKey: FieldNames.maximumNumberOfHitsPerBrick)
    }
    

}
