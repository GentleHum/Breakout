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
        static let minimumNumberOfHitsPerBrick = "minimumNumberOfHitsPerBrick"
        static let maximumNumberOfHitsPerBrick = "maximumNumberOfHitsPerBrick"
        static let numberOfBricksPerRow = "numberOfBricksPerRow"
        static let numberOfBrickRows = "numberOfBrickRows"
    }
    
    static var minimumNumberOfHitsPerBrick = 1
    static var maximumNumberOfHitsPerBrick = 1
    static var numberOfBricksPerRow = 10
    static var numberOfBrickRows = 5
    
    
    // load from NSUserDefaults
    static func load() {
        let defaults = UserDefaults.standard
        minimumNumberOfHitsPerBrick = defaults.integer(forKey: FieldNames.minimumNumberOfHitsPerBrick)
        maximumNumberOfHitsPerBrick = defaults.integer(forKey: FieldNames.maximumNumberOfHitsPerBrick)
        numberOfBricksPerRow = defaults.integer(forKey: FieldNames.numberOfBricksPerRow)
        numberOfBrickRows = defaults.integer(forKey: FieldNames.numberOfBrickRows)
    }
    
    // store to NSUserDefaults
    static func store() {
        let defaults = UserDefaults.standard
        defaults.set(minimumNumberOfHitsPerBrick, forKey: FieldNames.minimumNumberOfHitsPerBrick)
        defaults.set(maximumNumberOfHitsPerBrick, forKey: FieldNames.maximumNumberOfHitsPerBrick)
        defaults.set(numberOfBricksPerRow, forKey: FieldNames.numberOfBricksPerRow)
        defaults.set(numberOfBrickRows, forKey: FieldNames.numberOfBrickRows)
    }
    

}
