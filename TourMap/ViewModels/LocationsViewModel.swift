//
//  LocationsViewModel.swift
//  TourMap
//
//  Created by Mauli Gulati on 25/7/25.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewModel {
    
    var locations: [Location]
    var cameraPosition: MapCameraPosition
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    var showLocationsList: Bool = false

    var currentMapLocation: Location {
        didSet {
            updateCameraPosition(to: currentMapLocation)
        }
    }
    
    init() {
        let locations = LocationsDataService.locations

        guard let firstLocation = locations.first else {
            fatalError("Locations list is empty!")
        }
        self.locations = locations
        self.currentMapLocation = firstLocation

        self.cameraPosition = .region(
            MKCoordinateRegion(
                center: firstLocation.coordinates,
                span: mapSpan
            )
        )
    }

    func updateCameraPosition(to location: Location) {
        withAnimation(.easeInOut) {
            cameraPosition = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            currentMapLocation = location
            showLocationsList = false
        }
    }
}
