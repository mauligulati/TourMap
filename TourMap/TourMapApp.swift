//
//  TourMapApp.swift
//  TourMap
//
//  Created by Mauli Gulati on 25/7/25.
//

import SwiftUI

@main
struct TourMapApp: App {

    @State private var viewModel = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environment(viewModel)
        }
    }
}
