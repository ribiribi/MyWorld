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
    //var webAddress = ""
    //var location: CLLocationCoordinate2D!
    var image: Data?
    
    //MARK: - Inits
    init() {
        self.id = UUID().uuidString
    }
    
    init(name: String, description: String, image_in: Data?) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.image = image_in
    }
    
    init(type: PlaceType, name: String, description: String, webAddress: String, image_in: Data?) {
        self.id = UUID().uuidString
        //self.type = type
        self.name = name
        self.description = description
        //self.webAddress = webAddress
        self.image = image_in
    }
}
