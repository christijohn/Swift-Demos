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
    @IBOutlet weak var taxLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let tip = tipCalc.calculateTip(0.15)
        
        let alert = UIAlertController(title: "Tip kodu machi..!", message: String(format: "You have to give %.2f as Tip",tip), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
    }

    @IBAction func taxPctChanged(sender: AnyObject) {
        
        totalTextField.resignFirstResponder()
        taxLabel.text = String(format: "Tax percentage %.1f%%",taxSlider.value)
        print(taxLabel.text)
    }
    
}

