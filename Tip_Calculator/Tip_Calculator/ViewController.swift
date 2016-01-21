//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Christi John on 20/01/16.
//  Copyright © 2016 Christi John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    //optional string, may or may not have value
    var name:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //use of if let while dealing with optionals..
        if let myName = name{
            print("name is there \(myName)");
        }
        
        //Use of guard while dealing with optionals..
        guard let _ = name else{
            print("no name dude..!!")
            return;
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateAction(sender: AnyObject) {
        
        totalTextField.resignFirstResponder()
        
        let bill = Double(totalTextField.text!)
        let tax = Double(taxSlider.value)
        let tipCalc = TipCalculatorModel(totalBill: bill!, taxPct: tax)
        let tip = tipCalc.calculateTip(Double(tipSlider.value))
        
        let alert = UIAlertController(title: "Tip kodu machi..!", message: String(format: "You have to give %.2f as Tip",tip.tipAmount), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
    }

    @IBAction func taxPctChanged(sender: AnyObject) {
        
        totalTextField.resignFirstResponder()
        taxLabel.text = String(format: "Tax percentage %.1f%%",taxSlider.value)
        print(taxLabel.text)
    }
    
    @IBAction func tipPctChanged(sender: AnyObject) {
        
        totalTextField.resignFirstResponder()
        tipLabel.text = String(format: "Tip percentage %.1f%%",tipSlider.value)
    }
}

