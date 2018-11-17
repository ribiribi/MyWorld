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
    
    var toNameEdit = ""
    let manager = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameEdit.text = place.name
    }
    
    internal func textViewDidChange(_ textView: UITextView){
        for item in self.manager.places {
            if place.id == item.id{
                //Save into manager
                place.name = nameEdit.text
                
                //Save into file
                manager.saveJsonToFile(origin: manager.places)
            }
        }
    }

}