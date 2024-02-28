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

    func availableTrafficMessages () {
        AF.request(baseUrlString + "messages")
            .response { response in
            debugPrint(response)
        }
    }
}
