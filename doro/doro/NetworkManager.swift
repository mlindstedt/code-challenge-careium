//
//  NetworkManager.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    private let baseUrlString: String = "http://api.sr.se/api/v2/traffic/"
    
    func listAllAvailableTrafficMessages () {
        AF.request(baseUrlString + "messages")
            .response { response in
                debugPrint(response)
            }
    }
    
    func listAllTrafficAreas () {
        AF.request(baseUrlString + "areas")
            .response { response in
                debugPrint(response)
            }
    }

    func listTrafficArea(coordinates: Coordinates) {
        AF.request(baseUrlString + "areas?latitude=\(coordinates.latitude)&longitude=\(coordinates.longitude)")
            .response { response in
                debugPrint(response)
            }
    }
}
