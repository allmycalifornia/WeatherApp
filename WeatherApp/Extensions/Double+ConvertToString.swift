//
//  Double+ConvertToString.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

extension Double {
    
    var toTempString: String {
        return String(format: "%.f", self) + "°"
    }
}
