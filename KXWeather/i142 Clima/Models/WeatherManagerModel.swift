//
//  WeatherManagerModel.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 15/02/2025.
//

import Foundation
import CoreLocation

class WeatherManagerModel: ObservableObject {
    @Published var weather: WeatherModel?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=727c43eefa175bffb652b561a81d0abd&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let safeData = data, let weather = self.parseJSON(safeData) {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }.resume()
    }
    
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return WeatherModel(
                conditionId: decodedData.weather.first?.id ?? 800,
                cityName: decodedData.name,
                temperature: decodedData.main.temp
            )
        } catch {
            print("Decoding error: \(error)")
            return nil
        }
    }
}
