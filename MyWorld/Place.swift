//
//  Place.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit

final class Place: NSObject, Codable {
    //al posar "final" assegurem que no te subclasses i per tant no cal posar que els inicialitzadors (from: codable que estan a l'extenció place+jason) son "required" (required no es permès en cap extenció).
    enum PlaceType {
        case generic
        case touristic
    }
    
    var pickerViewArray = ["Default", "Culture", "Restaurant", "Museum", "Fast Foot", "Asian Restaurant"]
    var id = ""
    //var type = PlaceType.generic
    var name = ""
    var descriptionPlace = ""
    var webAddress = ""
    var position: CLLocationCoordinate2D
    var image: Data?
    var imageName = ""
    var iconTable = ""
    
    
    //MARK: - Inits    
    init (name: String, descriptionPlace: String, webAddress: String, image_in: Data?, position: CLLocationCoordinate2D, imageName: String, iconTable: String) {
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
