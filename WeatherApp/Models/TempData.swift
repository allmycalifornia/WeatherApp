//
//  TempData.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

struct TempData: Decodable, Hashable {
    let temp: Double
    let tempMax: Double
    let tempMin: Double
}
