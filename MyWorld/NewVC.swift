//
//  NewVC.swift
//  MyWorld
//
//  Created by user143594 on 11/21/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit
import MapKit

class NewVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate {

    let manager = PlaceManager.shared
    var place = Place(name: "", descriptionPlace: "", webAddress: "", position: CLLocationCoordinate2D(latitude: 42.4, longitude: 2.2), imageName: "", iconTable: "")
    var countNum = 0
    let locationManager = CLLocationManager()
    var actualPosition = CLLocationCoordinate2D(latitude: 41.41, longitude: 2.13)
    
    @IBOutlet weak var nameNew: UITextView!
    @IBOutlet weak var descriptionNew: UITextView!
    @IBOutlet weak var webAddressNew: UITextView!
    @IBOutlet weak var imageNew: UIImageView!
    @IBOutlet weak var pikerViewNew: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameNew?.text = "write the new name"
        self.imageNew?.image = UIImage(named: "modernBuilding")
        self.descriptionNew?.text = "write the description"
        self.webAddressNew.text = "write the web address"
        place.iconTable = "defaultBlue"
        
        // Ask for GPS Authorisation.
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        //Location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
}
    
    // MARK: --------------------------------------------------Functions
    //PickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return place.pickerViewArray.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        place.iconTable = place.pickerViewArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Georgia", size: 14.0)
            pickerLabel?.textAlignment = .center
            pickerLabel?.textColor = UIColor.white
        }
        pickerLabel?.text = place.pickerViewArray[row]
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }

    //Hide the iPhone keyboard
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx:0, dy: movement)
        UIView.commitAnimations()
    }
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        self.animateViewMoving(up: true, moveValue: 110)
    }
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.animateViewMoving(up: false, moveValue: 110)
    }
    
    //Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        actualPosition = locValue
        
        manager.stopUpdatingLocation()
    }
    
    //Back
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {

            
            //Save into manager
            countNum = manager.count()
            manager.append(place)
            manager.places[countNum].name = nameNew.text
            manager.places[countNum].descriptionPlace = descriptionNew.text
            manager.places[countNum].webAddress = webAddressNew.text
            manager.places[countNum].imageName = "modernBuilding"
            manager.places[countNum].position = actualPosition
            
            //Save into file
            manager.saveJsonToFile(origin: manager.places)
        }
    }

}
