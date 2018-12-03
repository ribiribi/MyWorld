//
//  DeleteVC.swift
//  MyWorld
//
//  Created by user143594 on 11/28/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class DeleteVC: UIViewController {

//    let places = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //@IBAction func showAlertButtonTapped(_ sender: UIButton) {
            
            // create the alert
            let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        //}
        
    }
    


}
