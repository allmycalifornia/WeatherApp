//
//  MainPageView.swift
//  WeatherApp
//
//  Created by Борис Кравченко on 06.10.2023.
//

import SwiftUI

struct MainPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) private var colorScheme
    
    @ObservedObject private var viewModel = MainPageViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(
            keyPath: \CityEntity.name,
            ascending: true
        )],
        animation: .default
    )
    private var cityEntities: FetchedResults<CityEntity>
    
    @State private var showList: Bool = false
    @State private var tabSelection = 0
    
    var body: some View {
        NavigationView {
            VStack {
                tabView
            }
            .background(
                colorScheme == .light
                ? Color(UIColor.systemGray6)
                : .black
            )
            .navigationBarHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action: {
                        showList = true
                    }) {
                        Image(systemName: "list.bullet")
                    }
                    .foregroundColor(.primary)
                }
            }
            .fullScreenCover(isPresented: $showList) {
                FindCityView(tabSelection: $tabSelection)
            }
        }
    }
}

private extension MainPageView {
    
    var tabView: some View {
        TabView(selection: $tabSelection) {
            CityView(city: nil, isCitySaved: true, isPresented: false)
                .tag(0)
            ForEach(Array(cityEntities.enumerated()), id: \.element) { cityEntity in
                CityView(
                    city: City(from: cityEntity.element),
                    isCitySaved: true,
                    isPresented: false
                )
                .tag(cityEntity.offset + 1)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .environment(\.managedObjectContext, CoreDataService.shared.viewContext)
    }
}
