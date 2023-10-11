//
//  SwiftUIWeatherApp.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import SwiftUI

@main
struct SwiftUIWeatherApp: App {

    var body: some Scene {
        WindowGroup {
            MainPageView()
                .environment(\.managedObjectContext, CoreDataService.shared.viewContext)
        }
    }
}
