//
//  FirstViewController.swift
//  Trade Tycoon
//
//  Created by Jared Armatis on 3/17/15.
//  Copyright (c) 2015 Jared Armatis. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentFunds: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        var newStock:Stock;
        super.viewDidLoad()
        let instance = PortfolioSingleton.sharedInstance;
        newStock = instance.getStock(0)
        quoteLabel.numberOfLines = 0
        quoteLabel.text = newStock.toString()
        currentFunds.text = "Funds : \(instance.getFunds())"
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        currentDate.text = dateFormatter.stringFromDate(instance.getDate())
        newStock.dateToString();
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

