//
//  NetworkProtocols.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation

protocol NetworkProtocols {
    func getWeatherData(url:URL, success: @escaping (weatherData)->(), failure: @escaping (APIError)->())
}
