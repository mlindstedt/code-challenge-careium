//
//  ContentView.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import SwiftUI
import Alamofire
import CoreLocationUI
import CoreLocation


struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            LocationButton {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .padding()

            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
                
                let coordinates = Coordinates(latitude: location.latitude, longitude: location.longitude)
                
                let _ = viewModel.getTrafficArea(coordinates: coordinates) { regionName in
                    viewModel.regionName = regionName
                }
                Text("\nYour location is in region: \(viewModel.regionName)")
                
                let _ = viewModel.getTrafficMessagesInArea(trafficareaname: viewModel.regionName) { TrafficMessage in
                    print(TrafficMessage)
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
