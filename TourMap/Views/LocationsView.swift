//
//  LocationsView.swift
//  TourMap
//
//  Created by Mauli Gulati on 25/7/25.
//


import SwiftUI
import MapKit

struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) var locationsViewModel
    
    var body: some View {
        @Bindable var bindablelocationsViewModel = locationsViewModel
        
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()                
                previewLayer
            }
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: locationsViewModel.toggleLocationsList) {
                Text(locationsViewModel.currentMapLocation.name + ", " + locationsViewModel.currentMapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationsViewModel.currentMapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsViewModel.showLocationsList ? 180 : 0))
                    }
            }
            .foregroundStyle(.primary)
            
            if locationsViewModel.showLocationsList {
                LocationsListView()
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .animation(.easeInOut, value: locationsViewModel.showLocationsList)
    }
    
    private var mapLayer: some View {
        @Bindable var bindablelocationsViewModel = locationsViewModel
        
        return Map(position: $bindablelocationsViewModel.cameraPosition) {
            ForEach(locationsViewModel.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(bindablelocationsViewModel.currentMapLocation == location ? 1 : 0.7)
                        .onTapGesture {
                            bindablelocationsViewModel.currentMapLocation = location
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private var previewLayer: some View {
        ZStack {
            ForEach(locationsViewModel.locations) { location in
                if locationsViewModel.currentMapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                        )
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
