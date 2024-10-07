//
//  ViewModelProtocols.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation
import UIKit

enum ImageStyle {
    case art
    case ic
}

enum unitType:String {
    case imperial
    case metric
    case kelvin
}

protocol WeatherDataManagerProtocols: ObservableObject {
    func getImage(_ ImageID: String, ImageStyle:ImageStyle) -> UIImage
    func loadWeatherData(unit: unitType,completionHandler: @escaping (_ jsonData:weatherData?) -> Void)
    func updateWeatherData(unit:unitType,completionHandler: @escaping (_ jsonData:weatherData?) -> Void)
    func getConfiguratioFeatures() -> Array<Any>
}
