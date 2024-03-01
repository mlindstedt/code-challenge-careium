//
//  ContentViewModel.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-02-28.
//

import Foundation
import SWXMLHash

final class ContentViewModel: ObservableObject {
class ContentViewModel: ObservableObject {
    private var networkManager: NetworkManager = NetworkManager()
    
    var regionName: String = ""
    // Singleton
    static let shared: ContentViewModel = ContentViewModel()

    init() {
    }

    func getTrafficMessagesInArea(trafficareaname: String, handler: @escaping (_ message : TrafficMessage) -> Void) {
        networkManager.listTrafficMessagesIn(trafficareaname: trafficareaname) { apiData in
            if let _ = apiData {
                let xml = XMLHash.parse(apiData!)
                let messages = xml["sr"]["messages"]
                print(messages)
                for child in messages["message"].children {
                    let name = child.element!.name
                    let text = child.element!.text
                    print("name \(name)")
                    print("text \(text)")
                }
                for child in messages["message"].children {
                    let name = child.element!.name
                    let text = child.element!.text
                    print("name \(name)")
                    print("text \(text)")
                }
            } else {
                print("Traffic messages was not retrieved from request")
            }
        }
    }
    }
    
    func getTrafficArea(coordinates: Coordinates, handler: @escaping (_ regionName : String) -> Void) {
        networkManager.listTrafficAreaWith(coordinates: coordinates) { apiData in
            if let _ = apiData {
                let xml = XMLHash.parse(apiData!)
                let area = xml["sr"]["area"]
                if let _ = area.element {
                    let regionName = area.element!.attribute(by: "name")!.text
                    handler(regionName)
                } else {
                    print("Error: Avoid crashing app, if area.element is empty")
                }
            } else {
                print("Error: Traffic area from coordinates, were not retrieved from request")
            }
        }
    }
}
