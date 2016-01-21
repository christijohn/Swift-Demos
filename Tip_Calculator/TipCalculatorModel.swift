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
    
    func returnSampleTips()->[Int:Double]{
        
        var tempDic = [Int:Double]()
        let tipArray = [0.15,0.20,0.25]
        
        for tip in tipArray{
            
            let intTip = Int(tip*100)
            let tipTuple = calculateTip(tip)
            tempDic[intTip] = tipTuple.tipAmount // Usage of tuple
        }
        return tempDic
    }
}