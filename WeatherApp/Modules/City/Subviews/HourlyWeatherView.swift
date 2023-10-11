//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import SwiftUI

struct HourlyWeatherView: View {
    let forecast: Forecast
    
    var body: some View {
        VStack(spacing: 8) {
            Text(forecast.dt.hour)
            VStack {
                Image(systemName: forecast.weather.first?.main.imageName ?? "")
                    .frame(width: 32, height: 32)
                Text(forecast.main.temp.toTempString)
            }
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(forecast: .init(
            dt: Date(),
            main: .init(
                temp: 23,
                tempMax: 26,
                tempMin: 21
            ),
            weather: [
                .init(
                    main: .clouds,
                    description: "Clouds"
                )
            ]
        ))
    }
}
