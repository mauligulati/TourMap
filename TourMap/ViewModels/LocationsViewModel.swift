//
//  LocationsViewModel.swift
//  TourMap
//
//  Created by Mauli Gulati on 25/7/25.
//

import Foundation

@Observable
class LocationsViewModel {
    
    var locations: [Location]
    
    init() {
        self.locations = LocationsDataService.locations
    }
}
