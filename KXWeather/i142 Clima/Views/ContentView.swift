//
//  ContentView.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 03/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State var city: String = ""
    @StateObject private var weatherManager = WeatherManagerModel()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                HeaderView(cityName: $city, weatherManager: weatherManager)
                    .padding()
                    .foregroundColor(Color("WeatherColor"))
                
                if let weather = weatherManager.weather {
                    Image(systemName: weather.conditionName)
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 100))
                        .padding(.trailing)
                    
                    HStack {
                        Text(weather.temperatureString)
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .foregroundColor(Color("WeatherColor"))
                        
                        Text("°C")
                            .font(.system(size: 100))
                            .foregroundColor(Color("WeatherColor"))
                    }
                    .padding(.trailing)
                    
                    Text(weather.cityName)
                        .font(.title)
                        .foregroundColor(Color("WeatherColor"))
                        .padding(.trailing)
                } else {
                    Text("Search for a city")
                        .font(.title)
                        .foregroundColor(Color("WeatherColor"))
                        .padding(.trailing)
                }
                
                Spacer()
                
                WeatherView(cityName: $city)
                
                Spacer()
            }
            .onAppear {
                weatherManager.fetchWeather(cityName: "Cambridge")
            }
        }
        .onAppear {
            weatherManager.fetchWeather(cityName: "Cambridge")
        }
    }
}

#Preview {
    ContentView()
}
