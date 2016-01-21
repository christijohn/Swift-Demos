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
    
    func calculateTip(tipPct:Double)->Double{
        
        return preTaxBill * (tipPct/10)
    }
    
    func returnSampleTips()->[Int:Double]{
        
        var tempDic = [Int:Double]()
        let tipArray = [0.15,0.20,0.25]
        
        for tip in tipArray{
            
            let intTip = Int(tip*100)
            tempDic[intTip] = calculateTip(tip)
        }
        return tempDic
    }
}