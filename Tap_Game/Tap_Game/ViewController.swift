//
//  ViewController.swift
//  Tap_Game
//
//  Created by Christi John on 19/01/16.
//  Copyright © 2016 Christi John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var count = 0
    var score = 0
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAction(sender: AnyObject) {
        
        score++
        scoreLabel.text = "\(score)"
        
    }

    func setupGame(){
        
        displayCountLabel(count)
        scoreLabel.text = ""
        score = 0
        count = 10

        timer = NSTimer .scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        
        count--
        displayCountLabel(count)
        
        if count == 0{
            
            timer.invalidate()
            
            let myAlert = UIAlertController(title: "Time is up dude!", message: "Your score is \(score)", preferredStyle: UIAlertControllerStyle.Alert)
            myAlert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
                action in self.setupGame()
            }))
            myAlert.addAction(UIAlertAction(title: "I quit", style: UIAlertActionStyle.Cancel, handler: nil))
            
            presentViewController(myAlert, animated: true, completion: nil)
            
        }
    }
    
    func displayCountLabel(temp:Int)->(){
        
        if(temp < 10){
            countLabel.text = "00:0\(temp)"
        }
        else{
            countLabel.text = "00:\(temp)"
        }

    }
}

