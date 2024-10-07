//
//  FirstViewController.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import UIKit
import Combine
import SwiftUI

class FirstViewController: UITableViewController {

    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> () = { }
    var weatherlisData: [weatherlistData] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = .accent
        view.backgroundColor = .accent
        tableView.register(UINib(nibName: "TodayTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayTableViewCell")
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
        //setupInfoLabel()
        //setupDetailButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if viewModel.weatherData == nil {
            viewModel.loadWeatherData(unit: viewModel.currentUnit) { (weatherData) in
                if let list = weatherData?.list {
                    self.weatherlisData = list
                    self.tableView.reloadData()
                }
            }
        }
        super.viewWillAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherlisData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.item {
        case 0:
            return 250
        default:
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let weather = weatherlisData[indexPath.item]
        let weatherIconID = weather.weather?.first
        
        if indexPath.item == 0 {
            let todayCell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell", for: indexPath) as! TodayTableViewCell
            if let iconID = weatherIconID?.icon {
               todayCell.iconImage.image = viewModel.getImage(iconID, ImageStyle: .art)
            }
            todayCell.backgroundColor = .accent
            todayCell.maxTempLabel.text = self.formatTemp(temp: weather.temp?.max)
            todayCell.minTempLabel.text = self.formatTemp(temp: weather.temp?.min)
            todayCell.TodatDateLabel.text = self.dateFormarter(interval: weather.dt, dateFormat: "'Today', MMM d")
            todayCell.weatherStatusLabel.text =  weatherIconID?.main
            
            cell = todayCell
        } else {
            let weatherCell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
            var dateformat = "EEEE, MMM d"
            if let iconID = weatherIconID?.icon {
                weatherCell.iconImage.image = viewModel.getImage(iconID, ImageStyle: .ic)
            }
            weatherCell.maxTempLabel.text = self.formatTemp(temp: weather.temp?.max)
            weatherCell.minTempLabel.text = self.formatTemp(temp: weather.temp?.min)
            if indexPath.item == 1 {
                dateformat = "'Tomorrow', MMM d"
            }
            
            weatherCell.DateLabel.text = self.dateFormarter(interval: weather.dt, dateFormat:dateformat )
            weatherCell.weatherStatusLabel.text =  weatherIconID?.main
            cell = weatherCell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDataSelected = weatherlisData[indexPath.item]
        let weatherIconID = weatherDataSelected.weather?.first
        var dateformat = "EEEE, MMM d"
        viewModel.currentselectedWeather = weatherDataSelected
        viewModel.dayText = self.dateFormarter(interval: weatherDataSelected.dt, dateFormat: dateformat)
        viewModel.weatherStatusText = weatherIconID?.main ?? ""
        viewModel.weatherHiTempText = self.formatTemp(temp: weatherDataSelected.temp?.max)
        viewModel.weatherLowTempText = self.formatTemp(temp: weatherDataSelected.temp?.min)
        viewModel.weatherIcon = Image("art_rain")
        viewModel.weatherNightTempText = self.formatTemp(temp: weatherDataSelected.temp?.night)
        viewModel.weatherEveningTempText = self.formatTemp(temp: weatherDataSelected.temp?.eve)
        viewModel.weatherDayTempText = self.formatTemp(temp: weatherDataSelected.temp?.day)
        viewModel.weatherMorningTempText = self.formatTemp(temp: weatherDataSelected.temp?.morn)
        viewModel.weatherhumidityText = "\(weatherDataSelected.humidity ?? 0)"
        viewModel.weatherGustText = ""
        viewModel.weatherSunriseText = "7:30 am"
        viewModel.weatherSunsetText = "7:30 pm"
        viewModel.weatherCloudsText = "86"
        viewModel.weatherPressureText = "1018"
        viewModel.weatherWindText = "8"
        viewModel.weatherFeelsLikeNText = "75"
        viewModel.weatherFeelsLikeEText = "82"
        viewModel.weatherFeelsLikeDText = "78"
        viewModel.weatherFeelsLikeMText = "74"
        self.buttonAction()
   }

    func dateFormarter(interval:Double?,dateFormat:String) -> String {
        let date = NSDate(timeIntervalSince1970: interval ?? 0)
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let myStringDate = formatter.string(from: date as Date)
        return myStringDate
    }
    
    func formatTemp(temp:Float?) -> String {
        let newTemp:Int = Int(temp ?? 0)
        return "\(newTemp)°"
    }
    
    @objc
    func buttonAction() {
        showDetailRequested()
    }
}

