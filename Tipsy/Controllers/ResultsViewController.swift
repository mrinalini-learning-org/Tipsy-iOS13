//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mrinalini Upadhya on 1/2/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var finalSplit: FinalSplit?

    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var splitDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (finalSplit != nil) {
            totalPerPerson.text = String(format: "%.2f", finalSplit?.totalPerPerson ?? 0)
            
            let splitBetween: String = String(finalSplit!.splitBetween)
            let tipPercentage: String = finalSplit!.tipPercentage
            splitDescription.text = "Split between \(splitBetween), with \(tipPercentage) tip."
        }
    }

    @IBAction func recalculateClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
