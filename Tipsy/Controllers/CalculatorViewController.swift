//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipsyBrain = TipsyBrain()
    
    var tip = 0.1
    var split = 2
    var billTotal = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
            
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
            
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = (bill as NSString).doubleValue
            tipsyBrain.calculate(billTotal, tip, Double(split))
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = tipsyBrain.getTotalBill()
            destinationVC.result = tipsyBrain.getResult()
            destinationVC.tip = tipsyBrain.getTip()
            destinationVC.split  = tipsyBrain.getSplit()
            
        }
    }
    
}

