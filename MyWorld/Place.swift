//
//  Place.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit

class Place: Codable {
    
    enum PlaceType {
        case generic
        case touristic
    }
    
    var id = ""
    //var type = PlaceType.generic
    var name = ""
    var description = ""
    var webAddress = ""
    var position: CLLocationCoordinate2D
    var image: Data?
    
    //If we want work with Codable protocol...
    enum PlaceKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    required convenience init(from: Decoder) throws {   //whats mean required convenience????
        let container = try from.container(keyedBy: PlaceKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        self.init(name: name, description: description, position: position)
    }
    init (name: String, description: String, position: CLLocationCoordinate2D){
        self.name = name
        self.description = description
        self.position = position
    }
    func encode(to: Encoder) throws {
        var container = to.container(keyedBy: PlaceKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(position.latitude, forKey: .latitude)
        try container.encode(position.longitude, forKey: .longitude)
    }
    //...
    
    //MARK: - Inits
//    init() {
//        self.id = UUID().uuidString
//    }
    
    init(name: String, description: String, webAddress: String, image_in: Data?, position: CLLocationCoordinate2D) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.webAddress = webAddress
        self.image = image_in
        self.position = position
    }
    
    init(type: PlaceType, name: String, description: String, webAddress: String, image_in: Data?, position: CLLocationCoordinate2D) {
        self.id = UUID().uuidString
        //self.type = type
        self.name = name
        self.description = description
        self.webAddress = webAddress
        self.image = image_in
        self.position = position
    }
}
