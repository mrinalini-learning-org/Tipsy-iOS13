//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    var pctButton: UIButton?
    var splitBetween: Int?
    var gotToResults: String?
    var finalSplitCalculator = FinalSplitCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotToResults = "gotToResults"
        pctButton = zeroPctButton
        splitBetween = 2
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let currentTitle = sender.currentTitle!
        
        switch currentTitle {
        case "0%":
            pctButton?.isSelected = false
            zeroPctButton.isSelected = true
            pctButton = zeroPctButton
        case "10%":
            pctButton?.isSelected = false
            tenPctButton.isSelected = true
            pctButton = tenPctButton
        case "20%":
            pctButton?.isSelected = false
            twentyPctButton.isSelected = true
            pctButton = twentyPctButton
        default:
            print("Something went wrong in tip chaged button click")
            
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitBetween = Int(sender.value)
        splitNumberLabel.text = String(splitBetween!)
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        let tipPctAsString = pctButton?.currentTitle ?? "0%"
        let billAmount = Float(billTextField.text ?? "0") ?? 0
        finalSplitCalculator.calculateFinalSplit(tipPctAsString, billAmount , splitBetween!)
        self.performSegue(withIdentifier: gotToResults!, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == gotToResults! {
            let destinationViewController = segue.destination as! ResultsViewController
            destinationViewController.finalSplit = finalSplitCalculator.finalSplit
        }
        
    }
   
}

