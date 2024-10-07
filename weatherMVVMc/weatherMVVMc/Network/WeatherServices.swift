//
//  WeatherServices.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation

class WeatherService: WeatherServiceProtocol {
    static let Shared = WeatherService()
    private let request = NetworkRequest.shared
    
    func getWeatherData(url:URL,completionHandler: @escaping (weatherData?) -> Void) {
        
        request.getWeatherData(url: url) { weatherData in
            completionHandler(weatherData)
        } failure: { error in
            completionHandler(nil)
            print("ERROR: \(error.localizedDescription)")
        }
    }
}
