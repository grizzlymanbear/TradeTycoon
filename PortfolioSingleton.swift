//
//  Portfolio.swift
//  Trade Tycoon
//
//  Created by Robert Witting on 3/30/15.
//  Copyright (c) 2015 Jared Armatis. All rights reserved.
//

import Foundation
import UIKit

class PortfolioSingleton: NSObject {
    var name = ""
    var funds = 0
    var stocks: [Stock] = []
    var currentDate: NSDate = NSDate()
    class var sharedInstance: PortfolioSingleton {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: PortfolioSingleton? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = PortfolioSingleton()
        }
        
        return Static.instance!
    }
    
    func addStock(ticker:String , date: NSDate){
        self.stocks.append(Stock(tickerSymbol: ticker,startDate: date))
    }
    
    func getStock(index:Int)->Stock{
        if(index<self.stocks.count){
            return self.stocks[index];
        }
        return self.stocks[0];
    }
    
    func setDate(date: NSDate){
        self.currentDate = date
    }
    
    func getDate()->NSDate{
        return self.currentDate
    }
    
    func incDate(){
        currentDate = currentDate.dateByAddingTimeInterval(60*60*24)
    }
    
    func setFunds(funds:Int){
        self.funds = funds;
    }
    
    func getFunds()->Int{
        return self.funds;
    }
    
}