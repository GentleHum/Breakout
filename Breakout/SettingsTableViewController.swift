//
//  SettingsTableViewController.swift
//  Breakout
//
//  Created by Mike Vork on 1/6/17.
//  Copyright © 2017 Mike Vork. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet private weak var bricksPerRowStepper: UIStepper!
    @IBOutlet private weak var bricksPerRowValue: UILabel!
    
    @IBAction private func bricksPerRowStepperAction(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        bricksPerRowValue.text = "\(stepperValue)"
        PropertySettings.numberOfBricksPerRow = stepperValue
        print("numberOfBricksPerRow: \(PropertySettings.numberOfBricksPerRow)")
    }
    
    
    @IBOutlet private weak var brickRowsValue: UILabel!
    @IBOutlet private weak var brickRowsStepper: UIStepper!
    
    @IBAction private func brickRowsStepperAction(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        brickRowsValue.text = "\(stepperValue)"
        PropertySettings.numberOfBrickRows = stepperValue
        print("numberOfBrickRows: \(PropertySettings.numberOfBrickRows)")
    }
    
    
    @IBOutlet private weak var minHitsPerBrickValue: UILabel!
    @IBOutlet private weak var minHitsPerBrickStepper: UIStepper!
    
    @IBAction private func minHitsStepperAction(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        minHitsPerBrickValue.text = "\(stepperValue)"
        PropertySettings.minimumNumberOfHitsPerBrick = stepperValue
        print("minHitsPerBrick: \(PropertySettings.minimumNumberOfHitsPerBrick)")
    }
    
    
    @IBOutlet private weak var maxHitsPerBrickValue: UILabel!
    @IBOutlet private weak var maxHitsPerBrickStepper: UIStepper!
    
    @IBAction private func maxHitsStepperAction(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        maxHitsPerBrickValue.text = "\(stepperValue)"
        PropertySettings.maximumNumberOfHitsPerBrick = stepperValue
        print("maxHitsPerBrick: \(PropertySettings.maximumNumberOfHitsPerBrick)")
    }
    
    
    @IBOutlet private weak var moveOnScreenTap: UISwitch!
    @IBAction private func moveOnScreenTapAction(_ sender: UISwitch) {
        PropertySettings.moveOnScreenTap = sender.isOn
        print("moveOnScreenTap: \(PropertySettings.moveOnScreenTap)")

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bricksPerRowValue.text = "\(PropertySettings.numberOfBricksPerRow)"
        bricksPerRowStepper.value = Double(PropertySettings.numberOfBricksPerRow)
        
        brickRowsValue.text = "\(PropertySettings.numberOfBrickRows)"
        brickRowsStepper.value = Double(PropertySettings.numberOfBrickRows)
        
        minHitsPerBrickValue.text = "\(PropertySettings.minimumNumberOfHitsPerBrick)"
        minHitsPerBrickStepper.value = Double(PropertySettings.minimumNumberOfHitsPerBrick)
        
        maxHitsPerBrickValue.text = "\(PropertySettings.maximumNumberOfHitsPerBrick)"
        maxHitsPerBrickStepper.value = Double(PropertySettings.maximumNumberOfHitsPerBrick)
        
        moveOnScreenTap.isOn = PropertySettings.moveOnScreenTap
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("storing properties from viewWillDisappear")  // zap
        PropertySettings.store()
    }
}
