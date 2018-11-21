//
//  NewVC.swift
//  MyWorld
//
//  Created by user143594 on 11/21/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class NewVC: UIViewController, UITextViewDelegate {

    let manager = PlaceManager.shared
    var place: Place!
    var refresh = false
    var last = 0
    
    
    @IBOutlet weak var nameNew: UITextView!
    @IBOutlet weak var descriptionNew: UITextView!
    @IBOutlet weak var webAddressNew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: --------------------------------------------------Functions
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
        self.animateViewMoving(up: true, moveValue: 100)
    }
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.animateViewMoving(up: false, moveValue: 100)
    }
    
    internal func textViewDidChange(_ textView: UITextView){
        //Save into manager
        if refresh == false{
            place?.name = nameNew.text
            place?.descriptionPlace = descriptionNew.text
            place?.webAddress = webAddressNew.text
            place?.imageName = "UOC 22@"
            manager.append(place)
            
            //Save into file
            manager.saveJsonToFile(origin: manager.places)

            refresh = true
        }
        else {
            last = manager.count()
            last -= 1
            place = manager.itemAt(position: last)
            print (manager.count())
            for item in self.manager.places {
                if place?.id == item.id{
                    place?.name = nameNew.text
                    place?.descriptionPlace = descriptionNew.text
                    place?.webAddress = webAddressNew.text
                    place?.imageName = "UOC 22@"
                    
                    manager.saveJsonToFile(origin: manager.places)
                }
            }
            
        }
        
        
    }
}
