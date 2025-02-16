//
//  WeatherService.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 03/01/2025.
//

import Foundation
import CoreLocation

class WeatherService: ObservableObject {
    @Published var weatherData: DailyWeather?

    func fetchWeather(for city: String) {
        getCoordinates(for: city) { location in
            guard let location = location else {
                print("Failed to get coordinates.")
                return
            }
            
            let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(location.latitude)&longitude=\(location.longitude)&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=auto"
            
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.weatherData = decodedData.daily
                        }
                    } catch {
                        print("Failed to decode weather data: \(error)")
                    }
                }
            }.resume()
        }
    }
    
    private func getCoordinates(for city: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { placemarks, error in
            if let location = placemarks?.first?.location {
                completion(location.coordinate)
            } else {
                completion(nil)
            }
        }
    }
}

struct WeatherResponse: Codable {
    let daily: DailyWeather
}

struct DailyWeather: Codable {
    let time: [String]
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
    let weathercode: [Int]
}

func getWeatherIcon(for code: Int) -> String {
    switch code {
    case 0: return "sun.max.fill" // Clear sky
    case 1, 2, 3: return "cloud.sun.fill" // Partly cloudy
    case 45, 48: return "cloud.fog.fill" // Fog
    case 51, 53, 55: return "cloud.drizzle.fill" // Light drizzle
    case 61, 63, 65: return "cloud.rain.fill" // Rain
    case 66, 67: return "cloud.sleet.fill" // Freezing rain
    case 71, 73, 75: return "cloud.snow.fill" // Snow
    case 80, 81, 82: return "cloud.heavyrain.fill" // Heavy rain showers
    case 95, 96, 99: return "cloud.bolt.fill" // Thunderstorms
    default: return "questionmark.diamond.fill" // Unknown weather
    }
}
