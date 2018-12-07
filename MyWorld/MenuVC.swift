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
    @IBOutlet weak var oneXTwo: UIButton!
    @IBOutlet weak var twoXTwo: UIButton!
    @IBOutlet weak var threeXThree: UIButton!
    
    var whatButton = ""
    
    
    @IBAction func oneXOne(_ sender: Any) {
        whatButton = "oneXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func twoXOne(_ sender: Any) {
        whatButton = "twoXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func threeXOne(_ sender: Any) {
        whatButton = "threeXOne"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func oneXTwo(_ sender: Any) {
        whatButton = "oneXTwo"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func twoXTwo(_ sender: Any) {
        whatButton = "twoXTwo"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    @IBAction func threeXThree(_ sender: Any) {
        whatButton = "threeXThree"
        performSegue(withIdentifier: "toTable", sender: sender)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //Adding format
        oneXOne.layer.cornerRadius = 8
        oneXOne.layer.borderColor = UIColor.white.cgColor
        oneXOne.layer.borderWidth = 0.5
        
        twoXOne.layer.cornerRadius = 8
        twoXOne.layer.borderColor = UIColor.white.cgColor
        twoXOne.layer.borderWidth = 0.5
        
        threeXOne.layer.cornerRadius = 8
        threeXOne.layer.borderColor = UIColor.white.cgColor
        threeXOne.layer.borderWidth = 0.5
        
        oneXTwo.layer.cornerRadius = 8
        oneXTwo.layer.borderColor = UIColor.white.cgColor
        oneXTwo.layer.borderWidth = 0.5
        
        twoXTwo.layer.cornerRadius = 8
        twoXTwo.layer.borderColor = UIColor.white.cgColor
        twoXTwo.layer.borderWidth = 0.5
        
        threeXThree.layer.cornerRadius = 8
        threeXThree.layer.borderColor = UIColor.white.cgColor
        threeXThree.layer.borderWidth = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTable"{

            let tableVC = segue.destination as! TableVC
            tableVC.whatButton = whatButton
        }
    }
}
