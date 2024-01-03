//
//  FinalSplitCalculator.swift
//  Tipsy
//
//  Created by Mrinalini Upadhya on 1/3/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct FinalSplitCalculator {
    
    var finalSplit: FinalSplit?
    
    mutating func calculateFinalSplit(_ tipPctAsString: String, _ billAmount: Float, _ splitBetween: Int) {
        
        let tipPctAsFloat = (Float(tipPctAsString.prefix(tipPctAsString.count - 1)) ?? 0) / 100
        let finalSplitAmount = (billAmount + (tipPctAsFloat * billAmount)) / Float(splitBetween)
        
        finalSplit = FinalSplit(totalPerPerson: finalSplitAmount, splitBetween: splitBetween, tipPercentage: tipPctAsString)
        print("tipPctAsFloat: \(tipPctAsFloat). splitBetween: \(splitBetween) billAmount \(billAmount). Final Split Amount: \(finalSplitAmount)")
    }
}
