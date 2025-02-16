//
//  WeatherView.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 03/01/2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var weatherService = WeatherService()
    @Binding var cityName: String

    var body: some View {
        VStack {
            if let weather = weatherService.weatherData {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<weather.time.count, id: \.self) { index in
                            VStack {
                                Text(weather.time[index])
                                    .font(.headline)
                                    .foregroundColor(.white)

                                Image(systemName: getWeatherIcon(for: weather.weathercode[index]))
                                    .font(.largeTitle)
                                    .symbolRenderingMode(.multicolor)

                                Text("\(weather.temperature_2m_max[index], specifier: "%.1f")°C")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Text("\(weather.temperature_2m_min[index], specifier: "%.1f")°C")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .frame(width: 120, height: 180)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        }
                    }
                    .padding()
                }
            } else {
                Text("Enter a city to get weather data")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .onAppear {
            weatherService.fetchWeather(for: "cambridge us")
        }
        .onChange(of: cityName) {
            weatherService.fetchWeather(for: cityName)  //  Update when city changes
        }
    }
}
