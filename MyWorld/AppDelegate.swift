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
        for place in manager.someTestPlaces {
            manager.append(place)
        }
        return true
    }
    
}
