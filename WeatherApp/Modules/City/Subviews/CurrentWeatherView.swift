//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weather: CurrentWeather?
    let name: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 4) {
                Text(name)
                    .font(.title)
                Text(weather?.main.temp.toTempString ?? "--")
                    .font(.system(size: 60))
                Image(systemName: weather?.weather.first?.main.imageName ?? "xmark.icloud")
                    .font(.system(size: 42))
                Text(weather?.weather.first?.description ?? "")
            }
            Spacer()
        }
        .padding()
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(
            weather: CurrentWeather(
                name: "Москва",
                coord: .init(
                    lat: 123,
                    lon: 123
                ),
                main: .init(
                    temp: 24.5,
                    tempMax: 26,
                    tempMin: 22
                ),
                weather: [
                    .init(
                        main: .clouds,
                        description: "clouds"
                    )
                ]
            ),
            name: "Москва"
        )
    }
}
