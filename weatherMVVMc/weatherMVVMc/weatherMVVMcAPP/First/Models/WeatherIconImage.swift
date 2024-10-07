//
//  WeatherIconImage.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation
import UIKit


class WeatherIconImage: WeatherImageProtocols {
    /*maps-transform image id value into enum to get image file*/
    func getMyWeatherImage(_ imageID: String) -> iconImage {
        switch imageID {
        case "01d","01n": return iconImage.clear
        case "02d","02n": return iconImage.light_clouds
        case "03d","03n","04d","04n": return iconImage.clouds
        case "09d","09n": return iconImage.light_rain
        case "10d","10n": return iconImage.rain
        case "11d","11n": return iconImage.storm
        case "13d","13n": return iconImage.snow
        case "50d","50n": return iconImage.fog
        default: return iconImage.none
        }
    }
    
}
