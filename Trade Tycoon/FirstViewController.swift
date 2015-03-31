//
//  FirstViewController.swift
//  Trade Tycoon
//
//  Created by Jared Armatis on 3/17/15.
//  Copyright (c) 2015 Jared Armatis. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let newStock = Stock(tickerSymbol: "MSFT",startDate: NSDate())
        quoteLabel.numberOfLines = 0
        quoteLabel.text = newStock.toString()
        newStock.dateToString();        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

