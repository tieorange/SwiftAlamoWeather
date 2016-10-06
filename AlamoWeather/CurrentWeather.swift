//
//  CurrentWeather.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 05/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather{
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityname: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDatails(completed: DownloadComlete){
        // Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{ response in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                if let name = dictionary["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dictionary["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemperatur = main["temp"] as? Double {
                        self._currentTemp = currentTemperatur
                        
                        let celsium = currentTemperatur - 273.15
                        
                        
                        self._currentTemp = Double(round(10*celsium)/10)
                        print(self._currentTemp)
                    }
                }
            }
    
//            print(result.value)
        }
        completed()
    }
    
    
    
}
