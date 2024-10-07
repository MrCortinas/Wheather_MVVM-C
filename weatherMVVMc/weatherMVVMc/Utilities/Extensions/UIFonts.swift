//
//  UIFonts.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/7/24.
//

import Foundation
import SwiftUI

extension Font {
    
    static var robotoTitle:Font? {
        return Font.custom("RobotoCondensed-Bold.ttf", size: 22)
    }
    
    static var robotoHiTemp:Font? {
        return Font.custom("RobotoCondensed-Light.ttf", size: 72)
    }
    
    static var robotoLowTemp:Font? {
        return Font.custom("RobotoCondensed-Light.ttf", size: 36)
    }
    
    static var robotoListHiTemp:Font? {
        return Font.custom("RobotoCondensed-Regular.ttf", size: 22)
    }
    
    static var robotoListLowTemp:Font? {
        return Font.custom("RobotoCondensed-Light.ttf", size: 14)
    }
}
