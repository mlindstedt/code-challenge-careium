//
//  ContentView.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import SwiftUI
import Alamofire
import CoreLocationUI


struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            LocationButton {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
