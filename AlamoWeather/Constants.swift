//
//  Constants.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 05/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "9e6f5a8071bf967c938e41877d120727"
let CURRENT_LAT = 52.232709
let CURRENT_LNG = 21.011349

typealias DownloadComlete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(CURRENT_LAT)\(LONGITUDE)\(CURRENT_LNG)\(APP_ID)\(APP_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Warsaw,pl&cnt=16&appid=9e6f5a8071bf967c938e41877d120727"

//api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=9e6f5a8071bf967c938e41877d120727
// api.openweathermap.org/data/2.5/forecast/daily?q=Warsaw,pl&cnt=16&appid=9e6f5a8071bf967c938e41877d120727
