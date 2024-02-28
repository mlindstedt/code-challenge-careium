//
//  ContentViewModel.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private var networkManager: NetworkManager = NetworkManager()
    
    // Singleton
    static let shared: ContentViewModel = ContentViewModel()

    init() {
    }
    
    func getTrafficArea(coordinates: Coordinates) {
        networkManager.listTrafficArea(coordinates: coordinates)
    }
    

}
