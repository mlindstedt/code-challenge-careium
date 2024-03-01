//
//  TrafficMessage.swift
//  doro
//
//  Created by Magnus Lindstedt on 2024-03-01.
//

import Foundation
import SWXMLHash

struct TrafficMessage: XMLObjectDeserialization {
    let priority: String
    let title: String
    let location: String
    let description: String
    let category: String

    static func deserialize(_ node: XMLIndexer) throws -> TrafficMessage {
        return try TrafficMessage(
            priority: node["priority"].value(),
            title: node["title"].value(),
            location: node["exactlocation"].value(),
            description: node["description"].value(),
            category: node["category"].value()
        )
    }
}
