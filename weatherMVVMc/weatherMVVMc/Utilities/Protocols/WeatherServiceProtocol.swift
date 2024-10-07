//
//  WeatherServiceProtocol.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation


protocol WeatherServiceProtocol {
    func getWeatherData(url:URL,completionHandler: @escaping (weatherData?) -> Void)
}
