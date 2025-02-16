# KXWeather
#### Video Demo: 
#### Description:
**KX Weather** is a weather application built using SwiftUI that provides real-time weather updates and a 7-day forecast for any city. It fetches data from the OpenWeather API & open-meteo API and presents it in a clean, user-friendly interface.

### Features:
- **Live Weather Updates:** Enter a city to get the latest temperature, weather conditions, and more.
- **7-Day Forecast:** View maximum and minimum temperatures for the upcoming week.
- **Beautiful UI:** A simple, clean, and modern SwiftUI interface.
- **Weather Icons:** Dynamic weather symbols based on real-time conditions.

### Technologies Used:
- **SwiftUI**: UI framework for building the app.
- **OpenWeather API and open-meteo API**: Fetches live weather data.
- **Combine Framework**: Handles asynchronous API calls.

### Project Files:
- **`ContentView.swift`**: Manages the main UI layout and user interactions.
- **`HeaderView.swift`**: Manages the search UI layout.
- **`WeatherView.swift`**: Displays the weekly forecast in a scrollable format.
- **`GeocodeResponse.swift `**: Handles fetching and decoding weather data with open-meteo API. API request logic.
- **`WeatherManagerModel.swift`**: Handles fetching and decoding weather data with OpenWeather API.
- **`WeatherService.swift`**: API request logic(OpenWeather).
- **`Assets.xcassets`**: Contains images and icons.

### Challenges Faced:
1. **Handling Asynchronous Data**: Used `@StateObject` and `Combine` to fetch and update UI dynamically.
2. **UI Responsiveness**: Ensured smooth layout on different screen sizes.
3. **Weather API Integration**: Managed JSON parsing and error handling efficiently.
