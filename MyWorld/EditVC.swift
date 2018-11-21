//
//  EditVC.swift
//  MyWorld
//
//  Created by user143594 on 11/15/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class EditVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var nameEdit: UITextView!
    @IBOutlet weak var descriptionEdit: UITextView!
    @IBOutlet weak var webAddressEdit: UITextView!
    
    var toNameEdit = ""
    let manager = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameEdit?.text = place.name
        self.imageEdit?.image = UIImage(named: place.imageName)
        self.descriptionEdit?.text = place.descriptionPlace
        self.webAddressEdit?.text = place.webAddress
    }
    // MARK: --------------------------------------------------Functions
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
        for item in self.manager.places {
            if place.id == item.id{
                //Save into manager
                place.name = nameEdit.text
                place.descriptionPlace = descriptionEdit.text
                place.webAddress = webAddressEdit.text
                
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
            }
        }
    
    }

}
