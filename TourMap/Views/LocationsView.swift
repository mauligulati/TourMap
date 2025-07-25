//
//  LocationsView.swift
//  TourMap
//
//  Created by Mauli Gulati on 25/7/25.
//

import SwiftUI

struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) var locationsViewModel

    var body: some View {
        List {
            ForEach(locationsViewModel.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
