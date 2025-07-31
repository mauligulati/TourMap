# 📍 TourMap

A beautifully animated SwiftUI app that showcases popular landmarks on a map. Users can explore locations, view previews, and dive into detailed descriptions — including Wikipedia links for more info.

---

## ✨ Features

✅ Tap on annotations to explore famous landmarks  
📍 MapKit-based interactive map with custom pins  
🧭 Animated **Location Preview View** on map tap  
📄 Detail screen with name, city, description & Wikipedia link  
📚 Clean architecture using **MVVM pattern**  
🎬 Smooth transitions and animations in SwiftUI  
💡 Uses bundled static data (no API required)  
🌐 Opens Wikipedia pages in Safari

---

## 📸 Screenshots

<details>
  <summary>📸 Light and Dark Mode Screenshots (click to expand)</summary>

  <p align="center">
    <img src="https://github.com/user-attachments/assets/4325012b-80ca-423d-b49e-97e92e38a428" width="300"/><br/>
    <em>🌙 Dark Mode</em>
  </p>

  <p align="center">
    <img src="https://github.com/user-attachments/assets/6fe87bd8-7381-4f19-a2c9-402b779dcc1b" width="300"/><br/>
    <em>🌞 Light Mode</em>
  </p>

</details>

---

## 🛠️ Tech Stack

| Layer           | Technology              |
|----------------|--------------------------|
| UI             | SwiftUI                 |
| Architecture   | MVVM                    |
| Language       | Swift 6.1.2             |
| IDE            | Xcode 16 (iOS 18 SDK)   |
| Maps           | MapKit                  |
| Data Layer     | Static bundled data     |
| External Links | Wikipedia (via Safari)  |

---

## 📦 Data Source

All location data is statically defined in `LocationsDataService.swift` and includes:

- 📍 **Rome**: Colosseum, Pantheon, Trevi Fountain  
- 🗼 **Paris**: Eiffel Tower, Louvre Museum  

Each `Location` model includes:
- Name, city, coordinates  
- Image references  
- Description  
- Wikipedia link

---

## 📂 Folder Structure

Here is an overview of the main folders and files in this project:

TourMap/
├── Models/             # Location model
├── ViewModels/         # LocationsViewModel (@Observable state)
├── Views/              # SwiftUI views (LocationsView, LocationsListView, etc.)
├── Resources/          # Assets, LaunchScreen
├── Services/           # LocationsDataService (static data)
└── TourMapApp.swift    # App entry point

---

## 🚀 Getting Started

1. git clone https://github.com/mauligulati/TourMap.git  
2. Open the project in Xcode 16 or later  
3. Run the app on an iOS Simulator or physical device (iOS 18.0+)  

✅ No dependencies, no setup — just clone, build, and explore!
