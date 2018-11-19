//
//  DescriptionVC.swift
//  MyWorld
//
//  Created by user143594 on 11/15/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    var toDescriptionLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.descriptionLabel.text = toDescriptionLabel
    }
    

    //MARK: ---------------------------------------  Navigation

}
