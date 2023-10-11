//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

struct CurrentWeather: Decodable {
    let name: String
    let coord: Coordinates
    let main: TempData
    let weather: [WeatherDescription]
}
