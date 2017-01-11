//
//  SettingsTableViewController.swift
//  Breakout
//
//  Created by Mike Vork on 1/6/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var bricksPerRowStepper: UIStepper!
    @IBOutlet weak var bricksPerRowValue: UILabel!
    
    @IBAction func bricksPerRowStepperAction(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        bricksPerRowValue.text = "\(stepperValue)"
        PropertySettings.numberOfBricksPerRow = stepperValue
        print("numberOfBricksPerRow: \(PropertySettings.numberOfBricksPerRow)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
