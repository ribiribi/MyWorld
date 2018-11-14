//
//  AppDelegate.swift
//  MyWorld
//
//  Created by user143594 on 11/11/18.
//  Copyright © 2018 user143594. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let manager = PlaceManager.shared
        
//        if let jsonData = manager.jsonFrom(places: manager.someTestPlaces){
//            let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            let filePath = docsPath.appendingPathComponent("places.json")
//            do{
//                try jsonData.write(to: filePath)
//                print ("Fitxers guardats en local")
//            } catch {
//                print ("Error al escriure fitxer local")
//            }
//        }
        
        let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = docsPath.appendingPathComponent("places.json")
        do{
            let jasonData = try Data(contentsOf: filePath)
            let places = manager.placesFrom(jsonData: jasonData)
            
            for place in places{
                manager.append(place)
            }
        } catch {
            
        }
        
//        let manager = PlaceManager.shared
//        for place in manager.someTestPlaces {
//            manager.append(place)
//        }
        return true
    }
}
