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
    
    func listAvailableTrafficMessages () {
        AF.request(baseUrlString + "messages")
            .response { response in
                debugPrint(response)
            }
    }
    
    func listTrafficAreas () {
        AF.request(baseUrlString + "areas")
            .response { response in
            debugPrint(response)
        }
    }
}
