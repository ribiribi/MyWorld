//
//  MapVC.swift
//  MyWorld
//
//  Created by user143594 on 11/18/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let manager = PlaceManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let region = MKCoordinateRegion(center: manager.places[1].coordinate, latitudinalMeters: 100_000, longitudinalMeters: 100_000)
        mapView.setRegion(region, animated: true)
        
        for item in manager.places {
            mapView.addAnnotation(item)
        }
    }
//MARK: --------------------------------------- Navigation
}
