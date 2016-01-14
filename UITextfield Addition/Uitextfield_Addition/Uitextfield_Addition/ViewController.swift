//
//  ViewController.swift
//  Uitextfield_Addition
//
//  Created by Christi John on 12/01/16.
//  Copyright © 2016 Christi John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextFied: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sumAction(sender: AnyObject) {
        
        firstTextField.resignFirstResponder()
        secondTextFied.resignFirstResponder()
        
        let number1        = Int (firstTextField.text!)
        let number2        = Int (secondTextFied.text!)
        let result         = number1! + number2!
        resultLabel.text   = String(result);
        
    }

    @IBAction func resetAction(sender: AnyObject) {
        
        firstTextField.text = ""
        secondTextFied.text = ""
        resultLabel.text    = ""
        firstTextField.becomeFirstResponder()
    }
}

