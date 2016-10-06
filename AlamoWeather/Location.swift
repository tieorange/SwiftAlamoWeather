//
//  Location.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 06/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import Foundation

class Location{
    static var sharedInstance = Location()
    private init(){  }
    
    var lat: Double!
    var lng: Double!
    
    
}
