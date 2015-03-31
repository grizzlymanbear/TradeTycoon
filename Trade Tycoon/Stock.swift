//
//  Stock.swift
//  Trade Tycoon
//
//  Created by Robert Witting on 3/28/15.
//  Copyright (c) 2015 Jared Armatis. All rights reserved.
//

import Foundation

class Stock{
    var quote:NSDictionary!;
    var historicalData:NSDictionary!;
    
    init(tickerSymbol:String,startDate:NSDate){
        var query = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22\(tickerSymbol)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
        var data = NSData(contentsOfURL: NSURL(string: query)!)
        var error: NSError?
        var currentDate = NSDate();
        var quoteDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary;
        
        if let query = quoteDictionary["query"] as? NSDictionary{
            if let results = query["results"] as? NSDictionary{
                if let quote = results["quote"] as? NSDictionary{
                    self.quote = quote;

                }
            }
        }
        
        query = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20%22\(tickerSymbol)%22%20and%20\(startDate)%20%3D%20%222009-9-11%22%20and%20endDate%20%3D%20%222009-9-12%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
    
        var histDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary;
        
        if let query = histDictionary["query"] as? NSDictionary{
            if let results = query["results"] as? NSDictionary{
                if let quote = results["quote"] as? NSDictionary{
                    self.historicalData = quote;
                }
            }
        }
    }
    
    func toString() -> String{
        var str:NSString="";
        var keys = self.quote.allKeys

        
        for (key,value) in self.quote{
            if let keyword = key as? NSString{
                str = str + keyword + " : "
            }
            if let val = value as? NSString{
                str = str + val + "\n"
            }
        
        }
        println(str)
        return str;
    }
    
    func dateToString()-> String{
        var str:NSString="";
        var key1 = self.historicalData.allKeys
        for (key,value) in self.historicalData{
            if let val = value as? NSDictionary{
                var k = val.allKeys
                for(k,v) in val{
                    if let keyword = k as? NSString{
                        str = str + keyword + " : "
                    }
                    if let valu = v as? NSString{
                        str = str + valu + "\n"
                    }
                }
            }
        }
        println(str);
        return str;
    }
}
/*
{
    "query": {
        "count": 124,
        "created": "2015-03-31T01:34:21Z",
        "lang": "en-US",
        "results": {
            "quote": [
            {
            "Symbol": "YHOO",
            "Date": "2010-03-10",
            "Open": "16.51",
            "High": "16.94",
            "Low": "16.51",
            "Close": "16.79",
            "Volume": "33088600",
            "Adj_Close": "16.79"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-09",
            "Open": "16.41",
            "High": "16.72",
            "Low": "16.40",
            "Close": "16.53",
            "Volume": "20755200",
            "Adj_Close": "16.53"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-08",
            "Open": "16.32",
            "High": "16.61",
            "Low": "16.30",
            "Close": "16.52",
            "Volume": "30554000",
            "Adj_Close": "16.52"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-05",
            "Open": "15.89",
            "High": "16.38",
            "Low": "15.89",
            "Close": "16.06",
            "Volume": "21415000",
            "Adj_Close": "16.06"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-04",
            "Open": "15.55",
            "High": "15.85",
            "Low": "15.52",
            "Close": "15.81",
            "Volume": "22906000",
            "Adj_Close": "15.81"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-03",
            "Open": "15.85",
            "High": "15.85",
            "Low": "15.55",
            "Close": "15.57",
            "Volume": "20613800",
            "Adj_Close": "15.57"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-02",
            "Open": "15.87",
            "High": "15.96",
            "Low": "15.67",
            "Close": "15.73",
            "Volume": "20101800",
            "Adj_Close": "15.73"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-03-01",
            "Open": "15.43",
            "High": "15.83",
            "Low": "15.40",
            "Close": "15.79",
            "Volume": "17238000",
            "Adj_Close": "15.79"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-26",
            "Open": "15.27",
            "High": "15.41",
            "Low": "15.16",
            "Close": "15.31",
            "Volume": "14975600",
            "Adj_Close": "15.31"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-25",
            "Open": "15.32",
            "High": "15.35",
            "Low": "15.13",
            "Close": "15.24",
            "Volume": "20126900",
            "Adj_Close": "15.24"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-24",
            "Open": "15.48",
            "High": "15.71",
            "Low": "15.33",
            "Close": "15.59",
            "Volume": "19284200",
            "Adj_Close": "15.59"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-23",
            "Open": "15.45",
            "High": "15.51",
            "Low": "15.14",
            "Close": "15.38",
            "Volume": "18346700",
            "Adj_Close": "15.38"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-22",
            "Open": "15.61",
            "High": "15.68",
            "Low": "15.44",
            "Close": "15.49",
            "Volume": "10463500",
            "Adj_Close": "15.49"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-19",
            "Open": "15.49",
            "High": "15.71",
            "Low": "15.33",
            "Close": "15.58",
            "Volume": "15407900",
            "Adj_Close": "15.58"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-18",
            "Open": "15.40",
            "High": "15.60",
            "Low": "15.32",
            "Close": "15.54",
            "Volume": "13700100",
            "Adj_Close": "15.54"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-17",
            "Open": "15.50",
            "High": "15.52",
            "Low": "15.32",
            "Close": "15.44",
            "Volume": "12731900",
            "Adj_Close": "15.44"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-16",
            "Open": "15.23",
            "High": "15.48",
            "Low": "15.18",
            "Close": "15.41",
            "Volume": "21447200",
            "Adj_Close": "15.41"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-12",
            "Open": "15.07",
            "High": "15.19",
            "Low": "14.85",
            "Close": "15.17",
            "Volume": "18926400",
            "Adj_Close": "15.17"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-11",
            "Open": "14.87",
            "High": "15.25",
            "Low": "14.77",
            "Close": "15.22",
            "Volume": "24509500",
            "Adj_Close": "15.22"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-10",
            "Open": "15.02",
            "High": "15.02",
            "Low": "14.48",
            "Close": "14.80",
            "Volume": "36518100",
            "Adj_Close": "14.80"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-09",
            "Open": "15.20",
            "High": "15.24",
            "Low": "14.94",
            "Close": "15.07",
            "Volume": "16716900",
            "Adj_Close": "15.07"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-08",
            "Open": "15.18",
            "High": "15.47",
            "Low": "14.95",
            "Close": "14.99",
            "Volume": "19856400",
            "Adj_Close": "14.99"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-05",
            "Open": "15.01",
            "High": "15.25",
            "Low": "14.92",
            "Close": "15.19",
            "Volume": "20713800",
            "Adj_Close": "15.19"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-04",
            "Open": "15.34",
            "High": "15.52",
            "Low": "14.99",
            "Close": "15.01",
            "Volume": "27668100",
            "Adj_Close": "15.01"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-03",
            "Open": "15.12",
            "High": "15.60",
            "Low": "15.12",
            "Close": "15.46",
            "Volume": "24730600",
            "Adj_Close": "15.46"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-02",
            "Open": "15.10",
            "High": "15.32",
            "Low": "15.03",
            "Close": "15.17",
            "Volume": "27555200",
            "Adj_Close": "15.17"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-02-01",
            "Open": "15.14",
            "High": "15.30",
            "Low": "14.87",
            "Close": "15.05",
            "Volume": "29865700",
            "Adj_Close": "15.05"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-29",
            "Open": "15.51",
            "High": "15.67",
            "Low": "14.90",
            "Close": "15.01",
            "Volume": "39664600",
            "Adj_Close": "15.01"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-28",
            "Open": "15.93",
            "High": "15.96",
            "Low": "15.44",
            "Close": "15.44",
            "Volume": "30159500",
            "Adj_Close": "15.44"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-27",
            "Open": "16.46",
            "High": "16.49",
            "Low": "15.77",
            "Close": "15.98",
            "Volume": "41701000",
            "Adj_Close": "15.98"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-26",
            "Open": "15.82",
            "High": "16.17",
            "Low": "15.70",
            "Close": "15.99",
            "Volume": "43979400",
            "Adj_Close": "15.99"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-25",
            "Open": "16.07",
            "High": "16.11",
            "Low": "15.74",
            "Close": "15.86",
            "Volume": "19683700",
            "Adj_Close": "15.86"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-22",
            "Open": "16.08",
            "High": "16.21",
            "Low": "15.81",
            "Close": "15.88",
            "Volume": "25132800",
            "Adj_Close": "15.88"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-21",
            "Open": "16.39",
            "High": "16.58",
            "Low": "16.10",
            "Close": "16.20",
            "Volume": "21858400",
            "Adj_Close": "16.20"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-20",
            "Open": "16.65",
            "High": "16.68",
            "Low": "16.25",
            "Close": "16.38",
            "Volume": "14419500",
            "Adj_Close": "16.38"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-19",
            "Open": "16.78",
            "High": "16.96",
            "Low": "16.64",
            "Close": "16.75",
            "Volume": "15182600",
            "Adj_Close": "16.75"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-15",
            "Open": "17.25",
            "High": "17.25",
            "Low": "16.75",
            "Close": "16.82",
            "Volume": "18415000",
            "Adj_Close": "16.82"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-14",
            "Open": "16.81",
            "High": "17.23",
            "Low": "16.80",
            "Close": "17.12",
            "Volume": "16715600",
            "Adj_Close": "17.12"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-13",
            "Open": "16.88",
            "High": "16.98",
            "Low": "16.65",
            "Close": "16.90",
            "Volume": "16955600",
            "Adj_Close": "16.90"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-12",
            "Open": "16.65",
            "High": "16.86",
            "Low": "16.60",
            "Close": "16.68",
            "Volume": "15672400",
            "Adj_Close": "16.68"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-11",
            "Open": "16.77",
            "High": "16.83",
            "Low": "16.48",
            "Close": "16.74",
            "Volume": "16181900",
            "Adj_Close": "16.74"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-08",
            "Open": "16.68",
            "High": "16.76",
            "Low": "16.62",
            "Close": "16.70",
            "Volume": "15470000",
            "Adj_Close": "16.70"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-07",
            "Open": "16.81",
            "High": "16.90",
            "Low": "16.57",
            "Close": "16.70",
            "Volume": "31816300",
            "Adj_Close": "16.70"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-06",
            "Open": "17.17",
            "High": "17.30",
            "Low": "17.07",
            "Close": "17.17",
            "Volume": "16422000",
            "Adj_Close": "17.17"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-05",
            "Open": "17.22",
            "High": "17.23",
            "Low": "17.00",
            "Close": "17.23",
            "Volume": "11718100",
            "Adj_Close": "17.23"
            },
            {
            "Symbol": "YHOO",
            "Date": "2010-01-04",
            "Open": "16.94",
            "High": "17.20",
            "Low": "16.88",
            "Close": "17.10",
            "Volume": "16587400",
            "Adj_Close": "17.10"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-31",
            "Open": "16.92",
            "High": "16.96",
            "Low": "16.77",
            "Close": "16.78",
            "Volume": "9515600",
            "Adj_Close": "16.78"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-30",
            "Open": "16.83",
            "High": "16.99",
            "Low": "16.81",
            "Close": "16.98",
            "Volume": "8188000",
            "Adj_Close": "16.98"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-29",
            "Open": "16.84",
            "High": "16.97",
            "Low": "16.68",
            "Close": "16.92",
            "Volume": "13450200",
            "Adj_Close": "16.92"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-28",
            "Open": "16.74",
            "High": "16.94",
            "Low": "16.68",
            "Close": "16.88",
            "Volume": "11504300",
            "Adj_Close": "16.88"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-24",
            "Open": "16.69",
            "High": "16.75",
            "Low": "16.65",
            "Close": "16.72",
            "Volume": "4736600",
            "Adj_Close": "16.72"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-23",
            "Open": "16.35",
            "High": "16.70",
            "Low": "16.00",
            "Close": "16.67",
            "Volume": "23584100",
            "Adj_Close": "16.67"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-22",
            "Open": "15.88",
            "High": "16.08",
            "Low": "15.82",
            "Close": "15.98",
            "Volume": "10631600",
            "Adj_Close": "15.98"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-21",
            "Open": "16.11",
            "High": "16.17",
            "Low": "15.85",
            "Close": "15.88",
            "Volume": "17806100",
            "Adj_Close": "15.88"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-18",
            "Open": "15.94",
            "High": "16.14",
            "Low": "15.78",
            "Close": "16.14",
            "Volume": "30021100",
            "Adj_Close": "16.14"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-17",
            "Open": "15.72",
            "High": "15.96",
            "Low": "15.64",
            "Close": "15.82",
            "Volume": "26156700",
            "Adj_Close": "15.82"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-16",
            "Open": "15.57",
            "High": "15.82",
            "Low": "15.47",
            "Close": "15.79",
            "Volume": "20637500",
            "Adj_Close": "15.79"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-15",
            "Open": "15.77",
            "High": "15.88",
            "Low": "15.65",
            "Close": "15.74",
            "Volume": "13272900",
            "Adj_Close": "15.74"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-14",
            "Open": "15.90",
            "High": "15.97",
            "Low": "15.64",
            "Close": "15.81",
            "Volume": "18086300",
            "Adj_Close": "15.81"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-11",
            "Open": "15.85",
            "High": "15.90",
            "Low": "15.62",
            "Close": "15.74",
            "Volume": "22607500",
            "Adj_Close": "15.74"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-10",
            "Open": "15.34",
            "High": "15.57",
            "Low": "15.24",
            "Close": "15.49",
            "Volume": "18743000",
            "Adj_Close": "15.49"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-09",
            "Open": "15.52",
            "High": "15.54",
            "Low": "15.12",
            "Close": "15.18",
            "Volume": "25396900",
            "Adj_Close": "15.18"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-08",
            "Open": "15.45",
            "High": "15.90",
            "Low": "15.23",
            "Close": "15.45",
            "Volume": "31160600",
            "Adj_Close": "15.45"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-07",
            "Open": "15.36",
            "High": "15.65",
            "Low": "15.32",
            "Close": "15.45",
            "Volume": "18035200",
            "Adj_Close": "15.45"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-04",
            "Open": "15.32",
            "High": "15.38",
            "Low": "15.00",
            "Close": "15.19",
            "Volume": "17576000",
            "Adj_Close": "15.19"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-03",
            "Open": "15.33",
            "High": "15.38",
            "Low": "15.10",
            "Close": "15.11",
            "Volume": "17196200",
            "Adj_Close": "15.11"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-02",
            "Open": "15.17",
            "High": "15.50",
            "Low": "15.16",
            "Close": "15.31",
            "Volume": "17807800",
            "Adj_Close": "15.31"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-12-01",
            "Open": "15.03",
            "High": "15.19",
            "Low": "14.85",
            "Close": "15.13",
            "Volume": "17096500",
            "Adj_Close": "15.13"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-30",
            "Open": "14.90",
            "High": "15.10",
            "Low": "14.80",
            "Close": "14.97",
            "Volume": "17587000",
            "Adj_Close": "14.97"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-27",
            "Open": "15.04",
            "High": "15.09",
            "Low": "14.88",
            "Close": "15.00",
            "Volume": "11452900",
            "Adj_Close": "15.00"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-25",
            "Open": "15.29",
            "High": "15.35",
            "Low": "15.17",
            "Close": "15.30",
            "Volume": "21370600",
            "Adj_Close": "15.30"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-24",
            "Open": "15.38",
            "High": "15.49",
            "Low": "15.20",
            "Close": "15.24",
            "Volume": "19774000",
            "Adj_Close": "15.24"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-23",
            "Open": "15.58",
            "High": "15.65",
            "Low": "15.34",
            "Close": "15.45",
            "Volume": "24501400",
            "Adj_Close": "15.45"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-20",
            "Open": "15.60",
            "High": "15.74",
            "Low": "15.36",
            "Close": "15.38",
            "Volume": "16127300",
            "Adj_Close": "15.38"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-19",
            "Open": "15.83",
            "High": "15.85",
            "Low": "15.52",
            "Close": "15.61",
            "Volume": "26891000",
            "Adj_Close": "15.61"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-18",
            "Open": "16.02",
            "High": "16.13",
            "Low": "15.84",
            "Close": "15.98",
            "Volume": "12775400",
            "Adj_Close": "15.98"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-17",
            "Open": "15.89",
            "High": "16.11",
            "Low": "15.73",
            "Close": "16.05",
            "Volume": "22249500",
            "Adj_Close": "16.05"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-16",
            "Open": "16.08",
            "High": "16.19",
            "Low": "15.92",
            "Close": "16.07",
            "Volume": "26125200",
            "Adj_Close": "16.07"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-13",
            "Open": "16.04",
            "High": "16.10",
            "Low": "15.92",
            "Close": "15.93",
            "Volume": "26453800",
            "Adj_Close": "15.93"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-12",
            "Open": "16.10",
            "High": "16.28",
            "Low": "15.97",
            "Close": "16.00",
            "Volume": "10210100",
            "Adj_Close": "16.00"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-11",
            "Open": "16.00",
            "High": "16.16",
            "Low": "15.92",
            "Close": "16.09",
            "Volume": "16346100",
            "Adj_Close": "16.09"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-10",
            "Open": "16.08",
            "High": "16.36",
            "Low": "16.01",
            "Close": "16.04",
            "Volume": "24097400",
            "Adj_Close": "16.04"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-09",
            "Open": "16.13",
            "High": "16.19",
            "Low": "15.97",
            "Close": "16.02",
            "Volume": "14831900",
            "Adj_Close": "16.02"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-06",
            "Open": "15.89",
            "High": "16.03",
            "Low": "15.76",
            "Close": "15.94",
            "Volume": "13562500",
            "Adj_Close": "15.94"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-05",
            "Open": "15.80",
            "High": "16.00",
            "Low": "15.74",
            "Close": "15.90",
            "Volume": "27732500",
            "Adj_Close": "15.90"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-04",
            "Open": "15.90",
            "High": "15.90",
            "Low": "15.66",
            "Close": "15.69",
            "Volume": "18697100",
            "Adj_Close": "15.69"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-03",
            "Open": "15.71",
            "High": "15.79",
            "Low": "15.63",
            "Close": "15.70",
            "Volume": "17240200",
            "Adj_Close": "15.70"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-11-02",
            "Open": "15.75",
            "High": "15.90",
            "Low": "15.59",
            "Close": "15.85",
            "Volume": "15258200",
            "Adj_Close": "15.85"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-30",
            "Open": "16.06",
            "High": "16.37",
            "Low": "15.80",
            "Close": "15.90",
            "Volume": "22321700",
            "Adj_Close": "15.90"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-29",
            "Open": "16.19",
            "High": "16.38",
            "Low": "15.74",
            "Close": "16.13",
            "Volume": "39146700",
            "Adj_Close": "16.13"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-28",
            "Open": "16.69",
            "High": "16.77",
            "Low": "16.02",
            "Close": "16.04",
            "Volume": "25044800",
            "Adj_Close": "16.04"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-27",
            "Open": "16.69",
            "High": "16.87",
            "Low": "16.35",
            "Close": "16.69",
            "Volume": "19917800",
            "Adj_Close": "16.69"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-26",
            "Open": "17.05",
            "High": "17.20",
            "Low": "16.67",
            "Close": "16.87",
            "Volume": "21213100",
            "Adj_Close": "16.87"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-23",
            "Open": "17.71",
            "High": "17.75",
            "Low": "17.09",
            "Close": "17.22",
            "Volume": "17760400",
            "Adj_Close": "17.22"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-22",
            "Open": "17.54",
            "High": "17.75",
            "Low": "17.30",
            "Close": "17.67",
            "Volume": "16018100",
            "Adj_Close": "17.67"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-21",
            "Open": "17.98",
            "High": "18.02",
            "Low": "17.57",
            "Close": "17.66",
            "Volume": "46204500",
            "Adj_Close": "17.66"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-20",
            "Open": "17.37",
            "High": "17.41",
            "Low": "16.87",
            "Close": "17.17",
            "Volume": "38320400",
            "Adj_Close": "17.17"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-19",
            "Open": "16.80",
            "High": "17.29",
            "Low": "16.70",
            "Close": "17.22",
            "Volume": "17878000",
            "Adj_Close": "17.22"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-16",
            "Open": "16.61",
            "High": "16.85",
            "Low": "16.40",
            "Close": "16.81",
            "Volume": "20479000",
            "Adj_Close": "16.81"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-15",
            "Open": "16.84",
            "High": "16.89",
            "Low": "16.46",
            "Close": "16.52",
            "Volume": "24337300",
            "Adj_Close": "16.52"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-14",
            "Open": "16.93",
            "High": "17.03",
            "Low": "16.82",
            "Close": "16.95",
            "Volume": "17508000",
            "Adj_Close": "16.95"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-13",
            "Open": "16.95",
            "High": "17.00",
            "Low": "16.81",
            "Close": "16.88",
            "Volume": "19492500",
            "Adj_Close": "16.88"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-12",
            "Open": "16.96",
            "High": "17.11",
            "Low": "16.66",
            "Close": "16.75",
            "Volume": "16904700",
            "Adj_Close": "16.75"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-09",
            "Open": "17.43",
            "High": "17.48",
            "Low": "16.84",
            "Close": "16.87",
            "Volume": "29015700",
            "Adj_Close": "16.87"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-08",
            "Open": "17.63",
            "High": "17.86",
            "Low": "17.54",
            "Close": "17.58",
            "Volume": "27966900",
            "Adj_Close": "17.58"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-07",
            "Open": "17.22",
            "High": "17.49",
            "Low": "17.15",
            "Close": "17.49",
            "Volume": "12456700",
            "Adj_Close": "17.49"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-06",
            "Open": "16.96",
            "High": "17.35",
            "Low": "16.95",
            "Close": "17.30",
            "Volume": "21427600",
            "Adj_Close": "17.30"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-05",
            "Open": "16.85",
            "High": "17.13",
            "Low": "16.66",
            "Close": "16.80",
            "Volume": "22224900",
            "Adj_Close": "16.80"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-02",
            "Open": "17.23",
            "High": "17.35",
            "Low": "16.78",
            "Close": "16.84",
            "Volume": "32685300",
            "Adj_Close": "16.84"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-10-01",
            "Open": "17.65",
            "High": "17.72",
            "Low": "17.20",
            "Close": "17.39",
            "Volume": "24871600",
            "Adj_Close": "17.39"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-30",
            "Open": "17.48",
            "High": "17.94",
            "Low": "17.24",
            "Close": "17.81",
            "Volume": "39878200",
            "Adj_Close": "17.81"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-29",
            "Open": "17.50",
            "High": "17.66",
            "Low": "17.21",
            "Close": "17.45",
            "Volume": "31600100",
            "Adj_Close": "17.45"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-28",
            "Open": "16.98",
            "High": "17.47",
            "Low": "16.95",
            "Close": "17.47",
            "Volume": "26412200",
            "Adj_Close": "17.47"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-25",
            "Open": "16.80",
            "High": "17.15",
            "Low": "16.75",
            "Close": "17.08",
            "Volume": "20701400",
            "Adj_Close": "17.08"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-24",
            "Open": "17.31",
            "High": "17.32",
            "Low": "16.65",
            "Close": "16.89",
            "Volume": "26493700",
            "Adj_Close": "16.89"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-23",
            "Open": "17.10",
            "High": "17.60",
            "Low": "16.97",
            "Close": "17.21",
            "Volume": "36814300",
            "Adj_Close": "17.21"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-22",
            "Open": "17.17",
            "High": "17.22",
            "Low": "16.75",
            "Close": "16.86",
            "Volume": "30588800",
            "Adj_Close": "16.86"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-21",
            "Open": "17.23",
            "High": "17.23",
            "Low": "16.96",
            "Close": "17.04",
            "Volume": "26826900",
            "Adj_Close": "17.04"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-18",
            "Open": "17.70",
            "High": "17.70",
            "Low": "16.85",
            "Close": "17.39",
            "Volume": "86402600",
            "Adj_Close": "17.39"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-17",
            "Open": "17.00",
            "High": "17.79",
            "Low": "16.96",
            "Close": "17.50",
            "Volume": "62010000",
            "Adj_Close": "17.50"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-16",
            "Open": "16.57",
            "High": "17.11",
            "Low": "16.52",
            "Close": "16.99",
            "Volume": "53594700",
            "Adj_Close": "16.99"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-15",
            "Open": "16.01",
            "High": "16.49",
            "Low": "15.87",
            "Close": "16.41",
            "Volume": "64668200",
            "Adj_Close": "16.41"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-14",
            "Open": "15.45",
            "High": "15.58",
            "Low": "15.28",
            "Close": "15.57",
            "Volume": "19451200",
            "Adj_Close": "15.57"
            },
            {
            "Symbol": "YHOO",
            "Date": "2009-09-11",
            "Open": "15.53",
            "High": "15.68",
            "Low": "15.41",
            "Close": "15.59",
            "Volume": "26860700",
            "Adj_Close": "15.59"
            }
            ]
        }
    }
}
*/