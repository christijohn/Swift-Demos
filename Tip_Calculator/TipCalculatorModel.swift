//
//  TipCalculatorModel.swift
//  Tip_Calculator
//
//  Created by Christi John on 20/01/16.
//  Copyright © 2016 Christi John. All rights reserved.
//

import Foundation

class TipCalculatorModel{
    
    //Stored Properties
    var postTaxBill : Double
    var taxPct : Double
    
    //Computed Property
    var preTaxBill:Double{
        get{
            return postTaxBill/(taxPct+1)
        }
    }
    
    init(totalBill:Double, taxPct:Double){
        
        self.postTaxBill = totalBill
        self.taxPct = taxPct
    }
    
    //Using tuple as return type
    func calculateTip(tipPct:Double)->(tipAmount:Double,billAmount:Double){
        
        return (preTaxBill * (tipPct/10), postTaxBill)
    }
    
    //Creating a diction with int keys and tuple values
    func returnSampleTips()->[Int:(tipAmount:Double,billAmount:Double)]{
        
        var tempDic = [Int:(tipAmount:Double,billAmount:Double)]()
        let tipArray = [0.15,0.20,0.25]
        
        for tip in tipArray{
            
            let intTip = Int(tip*100)
            tempDic[intTip] = calculateTip(tip) // Usage of tuple
        }
        return tempDic
    }
}