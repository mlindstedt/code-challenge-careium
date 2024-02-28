//
//  ContentView.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import SwiftUI
import Alamofire


struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
