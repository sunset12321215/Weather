//
//  Extension_GetThu.swift
//  Weather App
//
//  Created by mac on 8/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

extension Double
{
    func getDate(timeStamp : Double) -> String
    {
        let date = NSDate(timeIntervalSince1970: timeStamp)
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE"
        dayTimePeriodFormatter.locale = Locale(identifier: "VI")
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        
        return dateString
    }
}
