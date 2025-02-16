//
//  HeaderView.swift
//  i142 Clima
//
//  Created by Sachin Kaxhyap on 03/01/2025.
//

import SwiftUI

struct HeaderView: View {
    @Binding var cityName: String
    @ObservedObject var weatherManager: WeatherManagerModel

    var body: some View {
        HStack {
            Image(systemName: "location.north.circle.fill")
                .font(.system(size: 25))

            TextField("Search", text: $cityName)
                .frame(width: 300, height: 35)
                .multilineTextAlignment(.trailing)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .submitLabel(.go)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .opacity(0.5)
                .onSubmit {
                    searchCity()
                }

            Button(action: searchCity) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 25))
            }
        }
    }

    func searchCity() {
        weatherManager.fetchWeather(cityName: cityName)
        cityName = ""
    }
}
