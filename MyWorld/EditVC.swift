//
//  EditVC.swift
//  MyWorld
//
//  Created by user143594 on 11/15/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class EditVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var nameEdit: UITextView!
    @IBOutlet weak var descriptionEdit: UITextView!
    @IBOutlet weak var webAddressEdit: UITextView!
    @IBOutlet weak var pickerViewEdit: UIPickerView!

    let manager = PlaceManager.shared
    var place: Place!
    //var initialIcon = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameEdit?.text = place.name
        self.imageEdit?.image = UIImage(named: place.imageName)
        self.descriptionEdit?.text = place.descriptionPlace
        self.webAddressEdit?.text = place.webAddress
        //Load the pickerView
        if let initialIcon = place.pickerViewArray.index(of: place.iconTable){
            pickerViewEdit.selectRow(initialIcon, inComponent: 0, animated: true)
        }
        else{
            pickerViewEdit.selectRow(0, inComponent: 0, animated: true)
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
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = place.pickerViewArray[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 10.0)!,NSAttributedString.Key.foregroundColor:UIColor.white])
        return myTitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for item in self.manager.places {
            if place.id == item.id{
                //Save into manager
                place.name = nameEdit.text
                place.descriptionPlace = descriptionEdit.text
                place.webAddress = webAddressEdit.text
                place.iconTable = place.pickerViewArray[row]
                
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
            }
        }
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
