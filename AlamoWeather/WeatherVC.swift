//
//  WeatherVC.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 04/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentWeatherTypeLabel.text = "adf"
        tableView.delegate = self
        tableView.dataSource = self
        
    
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDatails {
            self.updateUI()
        }
    
        self.downloadForecastData {
            
        }
    }
    
    func downloadForecastData2(completed: @escaping DownloadComlete) {
        //Downloading forecast weather data for TableView
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    
    func downloadForecastData(completed: @escaping DownloadComlete){
        // Downloading data for TableView
        let forecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(forecastURL).responseJSON{ response in
            let result = response.result
            print("result = \(result)")
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    for obj in list{
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                }
            }
            completed()
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateUI(){
        dateLabel.text = self.currentWeather.date
        temperatureLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = self.currentWeather.weatherType
        cityLabel.text = self.currentWeather.cityname
        
        currentWeatherImage.image = UIImage(named: self.currentWeather.weatherType)
    }
    
    
    func updateFake(){
        dateLabel.text = self.currentWeather.date
        temperatureLabel.text = "9"
        currentWeatherTypeLabel.text = "Clouds"
        cityLabel.text = "Warsaw"
        
        currentWeatherImage.image = #imageLiteral(resourceName: "Clouds")
    }
}
