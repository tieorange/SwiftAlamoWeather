//
//  WeatherVC.swift
//  AlamoWeather
//
//  Created by Andrii Kovalchuk on 04/10/2016.
//  Copyright © 2016 Andrii Kovalchuk. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        currentWeatherTypeLabel.text = "adf"
        tableView.delegate = self
        tableView.dataSource = self
    
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
}
