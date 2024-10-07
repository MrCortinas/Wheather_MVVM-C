//
//  FirstTabViewModel.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation
import UIKit
import CoreLocation
import SwiftUICore

class FirstTabViewModel: WeatherDataManagerProtocols {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var dayText: String =  "October 3"
    @Published var weatherStatusText: String =  "Raining"
    @Published var weatherHiTempText: String =  "80"
    @Published var weatherLowTempText: String =  "69"
    @Published var weatherIcon: Image = Image("art_rain")
    @Published var weatherNightTempText: String =  "75"
    @Published var weatherEveningTempText: String =  "80"
    @Published var weatherDayTempText: String =  "78"
    @Published var weatherMorningTempText: String =  "75"
    @Published var weatherhumidityText: String =  "53"
    @Published var weatherGustText: String =  "15"
    @Published var weatherSunriseText: String =  "7:30"
    @Published var weatherSunsetText: String =  "7:30"
    @Published var weatherCloudsText: String =  "86"
    @Published var weatherPressureText: String =  "1018"
    @Published var weatherWindText: String =  "8"
    @Published var weatherFeelsLikeNText: String =  "75"
    @Published var weatherFeelsLikeEText: String =  "82"
    @Published var weatherFeelsLikeDText: String =  "78"
    @Published var weatherFeelsLikeMText: String =  "74"
    //static let share = FirstTabViewModel()
    public var weatherData:weatherData? = nil
    private var weatherURLString:String
    private let httpClient: WeatherServiceProtocol
    public var currentselectedWeather: weatherlistData? = nil
    public var currentUnit: unitType = .imperial
    
    // sets of custom init https://api.openweathermap.org/data/2.5/forecast/daily?lat=32.783058&lon=32.783058&mode=json&cnt=5&units=imperial&apikey=3aa158b2f14a9f493a8c725f8133d704
    init() {
        self.weatherURLString = "https://api.openweathermap.org/data/2.5/forecast/daily?q=Dallas&mode=json&cnt=5&units=imperial&apikey=3aa158b2f14a9f493a8c725f8133d704"
        self.httpClient = WeatherService()
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
    }
    // usefull for setting mocks enviroments or changing to a non production enviroment
    init(_ customHTTPClient:WeatherServiceProtocol, customURL:String ) {
        self.weatherURLString = customURL
        self.httpClient = customHTTPClient
    }
    
    /*maps your image icon from your weather id*/
    func getImage(_ ImageID: String, ImageStyle:ImageStyle) -> UIImage {
        let icon = WeatherIconImage()
        let image = icon.getMyWeatherImage(ImageID)
        switch ImageStyle {
        case .ic: return image.icImage() ?? UIImage()
        default: return image.artImage() ?? UIImage()
        }
    }
    
    
    /* call for data make sure you only call once  */
    func loadWeatherData(unit: unitType,completionHandler: @escaping (weatherData?) -> Void) {
        let newURL = setupWeatherURL(unit:unit)
        if URL(string: newURL ?? "") != nil {
            self.weatherURLString = newURL ?? ""
        }
        if weatherData == nil {
            if let url = URL(string: weatherURLString) {
                self.httpClient.getWeatherData(url: url) { (jsonData) in
                    self.weatherData = jsonData
                    completionHandler(jsonData)
                }
            } else {
                completionHandler(nil)
            }
        }else{
            completionHandler(self.weatherData)
        }
    }
    
    func updateWeatherData(unit: unitType, completionHandler: @escaping (weatherData?) -> Void) {
        if let url = URL(string: weatherURLString) {
            self.httpClient.getWeatherData(url: url) { (jsonData) in
                self.weatherData = jsonData
                completionHandler(jsonData)
            }
        } else {
            completionHandler(nil)
        }
    }
    
    private func setupWeatherURL(unit: unitType) -> String? {
        let locManager = CLLocationManager()
        var url:String? = nil
        locManager.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            currentLocation = locManager.location
            url = "https://api.openweathermap.org/data/2.5/forecast/daily?lat=\(currentLocation.coordinate.latitude)&lon=\(currentLocation.coordinate.longitude)&mode=json&cnt=5&units=\(unit.rawValue)&apikey=3aa158b2f14a9f493a8c725f8133d704"
        } else {
          url = "https://api.openweathermap.org/data/2.5/forecast/daily?q=Dallas&mode=json&cnt=5&units=\(unit.rawValue)&apikey=3aa158b2f14a9f493a8c725f8133d704"
        }
        return url
    }
    
    func getConfiguratioFeatures() -> Array<Any> {
        var configurations: Array<Any> = []
        configurations.append(currentUnit)
        if let cityInformation = weatherData?.city {
            configurations.append(["Name": cityInformation.name ])
            configurations.append(["id": cityInformation.id ])
            if let coords = cityInformation.coord {
                configurations.append(["lat": coords.lat ])
                configurations.append(["lot": coords.lon ])
            }
            configurations.append(["Country":cityInformation.country])
            configurations.append(["Population":cityInformation.population])
        }
        if weatherData?.cnt != nil {
            configurations.append(["CNT":weatherData?.cnt])
        }
        if weatherData?.cod != nil {
            configurations.append(["CoD":weatherData?.cod])
        }
        if weatherData?.message != nil {
            configurations.append(["message":weatherData?.message])
        }
        return configurations
    }
   
    
    
}
