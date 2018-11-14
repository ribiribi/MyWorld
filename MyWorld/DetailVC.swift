//
//  DetailVC.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    let places = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = place.name
        image?.image = UIImage(named: place.name)
    }
    
    // MARK: - Navigation
}
