//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

struct ForecastResponse: Decodable {
    let list: [Forecast]
}

struct Forecast: Decodable, Hashable {
    let dt: Date
    let main: TempData
    let weather: [WeatherDescription]
}
