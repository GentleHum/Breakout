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
    
    private struct SettingDefaults {
        static let minimumNumberOfHitsPerBrick = 1
        static let maximumNumberOfHitsPerBrick = 1
        static let numberOfBricksPerRow = 10
        static let numberOfBrickRows = 5
    }
    
    static var minimumNumberOfHitsPerBrick = SettingDefaults.minimumNumberOfHitsPerBrick
    static var maximumNumberOfHitsPerBrick = SettingDefaults.maximumNumberOfHitsPerBrick
    static var numberOfBricksPerRow = SettingDefaults.numberOfBricksPerRow
    static var numberOfBrickRows = SettingDefaults.numberOfBrickRows
    
    
    // load from NSUserDefaults
    static func load() {
        print("Loading property settings")  // zap
        let defaults = UserDefaults.standard
        minimumNumberOfHitsPerBrick = max(defaults.integer(forKey: FieldNames.minimumNumberOfHitsPerBrick),
                                          SettingDefaults.minimumNumberOfHitsPerBrick)
        maximumNumberOfHitsPerBrick = max(defaults.integer(forKey: FieldNames.maximumNumberOfHitsPerBrick),
                                          minimumNumberOfHitsPerBrick)
        numberOfBricksPerRow = max(defaults.integer(forKey: FieldNames.numberOfBricksPerRow),
                                   SettingDefaults.numberOfBricksPerRow)
        numberOfBrickRows = max(defaults.integer(forKey: FieldNames.numberOfBrickRows),
                                SettingDefaults.numberOfBrickRows)
    }
    
    // store to NSUserDefaults
    static func store() {
        print("Storing property settings")  // zap
        let defaults = UserDefaults.standard
        defaults.set(minimumNumberOfHitsPerBrick, forKey: FieldNames.minimumNumberOfHitsPerBrick)
        defaults.set(maximumNumberOfHitsPerBrick, forKey: FieldNames.maximumNumberOfHitsPerBrick)
        defaults.set(numberOfBricksPerRow, forKey: FieldNames.numberOfBricksPerRow)
        defaults.set(numberOfBrickRows, forKey: FieldNames.numberOfBrickRows)
    }
    

}
