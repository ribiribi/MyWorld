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
    @IBOutlet weak var twoXOne: UIButton!
    @IBOutlet weak var threeXOne: UIButton!
    
    var whatButton = ""
    
    
    @IBAction func oneXOne(_ sender: Any) {
        whatButton = "oneXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func twoXOne(_ sender: Any) {
        whatButton = "oneXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func threeXOne(_ sender: Any) {
        whatButton = "oneXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //Adding format
        oneXOne.layer.cornerRadius = 8
        oneXOne.layer.borderColor = UIColor.white.cgColor
        oneXOne.layer.borderWidth = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTable"{
            
            let tableVC = segue.destination as! TableVC
            tableVC.whatButton = whatButton
        }
    }
}
