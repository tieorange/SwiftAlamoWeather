//
//  Forecast.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 06/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import Foundation
import Alamofire

class Forecast{
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        // temp:
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double{
                self._lowTemp = "\(min  - 273.15)"
            }
            if let max = temp["max"] as? Double{
                self._highTemp = "\(max  - 273.15)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: date)
//            let dateFormater = DateFormatter()
            
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
    
}

extension Date {
    func dayOfTheWeek() -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: self)
    }
}
