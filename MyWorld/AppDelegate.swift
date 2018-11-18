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
       
//Manual append - we can remove that
//        for place in manager.someTestPlaces {
//            manager.append(place)
//        }
        
// MARK - Save and load data
//Save data
//        manager.saveJsonToFile(origin: manager.someTestPlaces)
        
//Load data
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
        return true
    }
}
