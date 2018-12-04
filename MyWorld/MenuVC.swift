//
//  MenuVC.swift
//  MyWorld
//
//  Created by user143594 on 12/4/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {


    
    @IBOutlet weak var oneXOne: UIButton!
    
    @IBAction func oneXOne(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Adding format
        oneXOne.layer.cornerRadius = 8
        oneXOne.layer.borderColor = UIColor.white.cgColor
        oneXOne.layer.borderWidth = 0.5
    }
}
