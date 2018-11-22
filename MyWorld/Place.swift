//
//  Place.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, Codable {
    
    enum PlaceType {
        case generic
        case touristic
    }
    
    var id = ""
    //var type = PlaceType.generic
    var name = ""
    var descriptionPlace = ""
    var webAddress = ""
    var position: CLLocationCoordinate2D
    var image: Data?
    var imageName = ""
    var iconTable = ""
    
   //var coordinate: CLLocationCoordinate2D
    
    //If we want work with Codable protocol...
    enum PlaceKeys: String, CodingKey {
        case name = "name"
        case descriptionPlace = "descriptionPlace"
        case webAddress = "webAddress"
        case latitude = "latitude"
        case longitude = "longitude"
        case imageName = "imageName"
        case iconTable = "iconTable"
    }
    required convenience init(from: Decoder) throws {   //whats mean required convenience????
        let container = try from.container(keyedBy: PlaceKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let descriptionPlace = try container.decode(String.self, forKey: .descriptionPlace)
        let webAddress = try container.decode(String.self, forKey: .webAddress)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let imageName = try container.decode(String.self, forKey: .imageName)
        let iconTable = try container.decode(String.self, forKey: .iconTable)

        self.init(name: name, descriptionPlace: descriptionPlace, webAddress: webAddress, position: position, imageName: imageName, iconTable: iconTable)
    }

    func encode(to: Encoder) throws {
        var container = to.container(keyedBy: PlaceKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(descriptionPlace, forKey: .descriptionPlace)
        try container.encode(webAddress, forKey: .webAddress)
        try container.encode(position.latitude, forKey: .latitude)
        try container.encode(position.longitude, forKey: .longitude)
        try container.encode(imageName, forKey: .imageName)
        try container.encode(iconTable, forKey: .iconTable)
    }
    //...
    
    //MARK: - Inits
    
    init(name: String, descriptionPlace: String, webAddress: String, image_in: Data?, position: CLLocationCoordinate2D, imageName: String, iconTable: String) {
        self.id = UUID().uuidString
        self.name = name
        self.descriptionPlace = descriptionPlace
        self.webAddress = webAddress
        self.image = image_in
        self.position = position
        self.imageName = imageName
        self.iconTable = iconTable
    }
    
    init (name: String, descriptionPlace: String, webAddress: String, position: CLLocationCoordinate2D, imageName: String, iconTable: String){
        self.name = name
        self.descriptionPlace = descriptionPlace
        self.webAddress = webAddress
        self.position = position
        self.imageName = imageName
        self.iconTable = iconTable
    }
}

//Extension required by MKAnnotation
extension Place: MKAnnotation{
    var coordinate: CLLocationCoordinate2D{
        return position
    }
    var title: String?{
        return name
    }
}
