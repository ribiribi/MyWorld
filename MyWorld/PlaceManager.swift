//
//  PlaceManager.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit

class PlaceManager {

    static let shared = PlaceManager()

    var places = [Place]()
    
    private init() {}
    
    //MARK: --------------------------------------- Class functions
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
    
    //MARK: ---------------------------------------  Access to files and codification
    func jsonFrom(places: [Place]) -> Data?{
        var jsonData: Data? = nil
        let jsonEnconder = JSONEncoder()
        
        do{
            jsonData = try jsonEnconder.encode(places)
        } catch {
            return nil
        }
        return jsonData
    }
    
    func placesFrom (jsonData: Data) -> [Place]{
        let jsonDecoder = JSONDecoder()
        let places: [Place]
        
        do{
            places = try jsonDecoder.decode([Place].self, from: jsonData)
        } catch{
            return []
        }
        return places
    }

    func saveJsonToFile(origin: [Place]){
        let manager = PlaceManager.shared
        
        if let jsonData = manager.jsonFrom(places: origin){
            let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let filePath = docsPath.appendingPathComponent("places.json")
            do{
                try jsonData.write(to: filePath)
                print ("Fitxers guardats en local")
            } catch {
                print ("Error al escriure fitxer local")
            }
        }
    }
    
    //MARK: ---------------------------------------  Only for demo purposes
    var someTestPlaces = [
        Place(name: "UOC 22@",
              descriptionPlace: "Seu de la Universitat Oberta de Catalunya",
              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.2),
              imageName: "UOC 22@",
              iconTable: "cultureBlue"),
        Place(name: "Rostisseria Lolita",
              descriptionPlace: "Els millors pollastres de Sant Cugat,de la comarca i dels multiversos coneguts...",
              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 42.7, longitude: 2.3),
              imageName: "Rostisseria Lolita",
              iconTable: "pizzaBlue"),
        Place(name: "CIFO L'hospitalet",
              descriptionPlace: "Seu del Centre d'Innovació i Formació per a l'Ocupació",
              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 42.1, longitude: 2.5),
              imageName: "cifo",
              iconTable: "cultureBlue"),
        Place(name: "Out of china",
              descriptionPlace: "Millor restaurant chines de Barcelona. Amb tocs de cuina fusió catalana, ambient acollidor. Reservar sempre: un dels punts més fluixos es l'ambient que respira un xic d'estres.",
              webAddress: "http://www.outofchinabarcelona.com/",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 42.1, longitude: 2.5),
              imageName: "outOfChina",
              iconTable: "restaurantBlue"),
        Place(name: "CosmoCaixa",
              descriptionPlace: "Museu de la Ciència de Barcelona",
              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 42.1, longitude: 2.5),
              imageName: "CosmoCaixa",
              iconTable: "museumBlue"),

        /*
        PlaceTourist(name: "CosmoCaixa",
                     descriptionPlace: "Museu de la Ciència de Barcelona",
                     discount_tourist: "50%", webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona", image_in: nil),
        PlaceTourist(name: "Park Güell",
                     descriptionPlace: "Obra d'Antoni Gaudí a Barcelona",
                     discount_tourist: "10%", webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona", image_in: nil)
        */
    ]
//    var someTestPlaces = [
//        Place(name: "UOC 22@",
//              descriptionPlace: "Seu de la Universitat Oberta de Catalunya",
//              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
//              image_in: nil,
//              position: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.2),
//              imageName: "UOC 22@"),
//        Place(name: "Rostisseria Lolita",
//              descriptionPlace: "Els millors pollastres de Sant Cugat,de la comarca i dels multiversos coneguts...",
//              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
//              image_in: nil,
//              position: CLLocationCoordinate2D(latitude: 42.7, longitude: 2.3),
//              imageName: "Rostisseria Lolita"),
//        Place(name: "CIFO L'hospitalet",
//              descriptionPlace: "Seu del Centre d'Innovació i Formació per a l'Ocupació",
//              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
//              image_in: nil,
//              position: CLLocationCoordinate2D(latitude: 42.1, longitude: 2.5),
//              imageName: "cifo")
//    ]
}
