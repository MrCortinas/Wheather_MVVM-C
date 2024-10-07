//
//  WeatherImageProtocols.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation
import UIKit

enum iconImage:String {
    case clear
    case light_clouds
    case clouds
    case light_rain
    case rain
    case storm
    case snow
    case fog
    case none
    
    func artImage() -> UIImage? {
        let imageName:String = self.rawValue
        return UIImage(named: "art_\(imageName).png")
    }
    
    func icImage() -> UIImage? {
        if self == .clouds {
            return UIImage(named: "ic_cloudy.png")
        }
        let imageName:String = self.rawValue
        return UIImage(named: "ic_\(imageName).png")
    }
    
}

protocol WeatherImageProtocols {
    func getMyWeatherImage(_ imageID:String) -> iconImage
}
