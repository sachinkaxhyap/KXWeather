//
//  WeatherData.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 15/02/2025.
//


import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}