//
//  DeleteVC.swift
//  MyWorld
//
//  Created by user143594 on 11/28/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class DeleteVC: UIViewController {

    var place: Place!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)
        
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
            self.present(alert, animated: true, completion: nil)
    }
}
