//
//  DetailVC.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//
//Detail and Description ViewControllers
import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var descriptionView: UIView!
    
    
    let places = PlaceManager.shared
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name?.text = place.name
        image?.image = UIImage(named: place.name)
        //descriptionLabel?.text = place?.description
        
        
//MARK: - Slide to description view
        var swipeGesture  = UISwipeGestureRecognizer()
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.up, .down, .right, .left]
        for direction in directions {
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(DetailVC.swipeView(_:)))
            descriptionView?.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            descriptionView?.isUserInteractionEnabled = true
            descriptionView?.isMultipleTouchEnabled = true
        }
    }
    
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDescription" {
                let descriptionVC = segue.destination as! DetailVC
                descriptionVC.descriptionLabel?.text = place.description
        }
    }
    
    @objc func swipeView(_ sender : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .left {
                self.descriptionView.frame = CGRect(x: self.view.frame.size.width - self.descriptionView.frame.size.width, y: self.descriptionView.frame.origin.y , width: self.descriptionView.frame.size.width, height: self.descriptionView.frame.size.height)
                self.performSegue(withIdentifier: "toDescription", sender: UIView())
            }
//            else if {
//                  intentar fer un undwind
//            }
            self.descriptionView.layoutIfNeeded()
            self.descriptionView.setNeedsDisplay()
        }
    }
}
