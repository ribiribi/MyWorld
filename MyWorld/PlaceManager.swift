//
//  PlaceManager.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation

class PlaceManager {

    static let shared = PlaceManager()
    //var newPlace = [Place]()
    private var places = [Place]()
    
    private init() {}
    
    
    // MARK: - Class functions
    func append(_ place: Place) {
        places.append(place)
    }
    
    func count() -> Int {
        return places.count
    }
    
    func itemAt(position: Int) -> Place? {
        // guard let us specify some condition that needs to be fulfilled.
        guard position < places.count else { return nil }
        return places[position]
    }
    
    func itemWithId(_ id: String) -> Place? {
        return places.filter {$0.id == id}.first
    }
    
    func remove(_ place: Place) {
        places = places.filter {$0.id != place.id}
    }
    
    
    // MARK: - Only for demo purposes
    var someTestPlaces = [
        Place(name: "UOC 22@",
              description: "Seu de la Universitat Oberta de Catalunya",
              image_in: nil),
        Place(name: "Rostisseria Lolita",
              description: "Els millors pollastres de Sant Cugat",
              image_in: nil),
        Place(name: "CIFO L'hospitalet",
              description: "Seu del Centre d'Innovació i Formació per a l'Ocupació",
              image_in: nil),
        /*PlaceTourist(name: "CosmoCaixa",
                     description: "Museu de la Ciència de Barcelona",
                     discount_tourist: "50%", webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona", image_in: nil),
        PlaceTourist(name: "Park Güell",
                     description: "Obra d'Antoni Gaudí a Barcelona",
                     discount_tourist: "10%", webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona", image_in: nil)
 */
    ]
}