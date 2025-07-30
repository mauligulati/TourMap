//
//  LocationsListView.swift
//  TourMap
//
//  Created by Mauli Gulati on 29/7/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @Environment(LocationsViewModel.self) var locationsViewModel

    var body: some View {
        List {
            ForEach(locationsViewModel.locations) { location in
                Button {
                    locationsViewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environment(LocationsViewModel())
}
