//
//  TipDetailViewController.swift
//  Tip_Calculator
//
//  Created by Christi John on 22/01/16.
//  Copyright © 2016 Christi John. All rights reserved.
//

import UIKit

class TipDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataArray:Array <(tipAmount:Double,billAmount:Double)>?
    var tipArray:Array<Double>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tipArray = [0.10,0.15,0.20,0.25,0.30]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        guard let count = dataArray?.count else{
            return 0;
        }
        return count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")
        let item = dataArray?[indexPath.row]
        tableViewCell?.textLabel?.text = String(format: "Percentage :%.1f %%, Tip Amount : %.1f",tipArray![indexPath.row],item!.tipAmount)
        
        return tableViewCell!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
