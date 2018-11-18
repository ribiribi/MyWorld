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

        for item in manager.places {
            mapView.addAnnotation(item)
        }
    }
    // MARK: - Navigation
}
