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
    
    func listTrafficMessagesIn(trafficareaname: String, handler: @escaping (_ apiData : Data?) -> Void) {
        AF.request(baseUrlString + "messages?trafficareaname=\(trafficareaname)")
            .response { response in
                debugPrint(response)
                handler(response.data)
            }
    }
    
    func listAllTrafficAreas () {
        AF.request(baseUrlString + "areas")
            .response { response in
                debugPrint(response)
            }
    }

    func listTrafficAreaWith(coordinates: Coordinates, handler: @escaping (_ apiData : Data?) -> Void) {
        AF.request(baseUrlString + "areas?latitude=\(coordinates.latitude)&longitude=\(coordinates.longitude)")
            .response { response in
                debugPrint(response)
                handler(response.data)
            }
    }
}
