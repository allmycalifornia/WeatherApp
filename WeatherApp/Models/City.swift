//
//  City.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import Foundation

struct City: Decodable, Hashable {
    let name: String
    let lat: Double
    let lon: Double
    let localNames: [String: String]?
    
    var localName: String {
        localNames?[Locale.current.languageCode ?? "ru"] ?? name
    }
    
    var coordinates: Coordinates {
        Coordinates(lat: lat, lon: lon)
    }
}

extension City {
    
    init(from entity: CityEntity) {
        name = entity.name
        lat = entity.lat
        lon = entity.lon
        localNames = nil
    }
}

extension City: Identifiable {
    
    var id: String {
        return "\(lat) \(lon)"
    }
}
