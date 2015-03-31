//
//  PortfolioViewController.swift
//  Trade Tycoon
//
//  Created by Robert Witting on 3/30/15.
//  Copyright (c) 2015 Jared Armatis. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var funds: UITextField!
    @IBOutlet weak var ticker: UITextField!
    @IBOutlet weak var startDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    @IBAction func submit(sender: AnyObject) {
        let instance = PortfolioSingleton.sharedInstance;
        instance.addStock(self.ticker.text, date: startDate.date);
        var startValue:Int? = 1000;
        startValue = funds.text.toInt()
        if(startValue != nil && startValue > 1000){
            instance.setFunds(startValue!)
        }
        instance.setDate(startDate.date)
        
    }
    
    /*
    @IBAction func submit(sender: UIButton) {
        let instance = PortfolioSingleton.sharedInstance;
        instance.addStock(self.ticker.text, date: startDate.date);
    }*/
}

