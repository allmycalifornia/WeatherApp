//
//  WeatherDescription.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

struct WeatherDescription: Decodable, Hashable {
    let main: WeatherStatus
    let description: String
}
