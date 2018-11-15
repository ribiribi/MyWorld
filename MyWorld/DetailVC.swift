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
    //@IBOutlet var descriptionView: UIView!
    @IBOutlet var detailView: UIView!
    
    
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
            detailView?.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            detailView?.isUserInteractionEnabled = true
            detailView?.isMultipleTouchEnabled = true
        }
    }
    
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDescription" {
            let descriptionVC = segue.destination as! DescriptionVC
            descriptionVC.toDescriptionLabel = place.description
        }
    }
    
    @objc func swipeView(_ sender : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .left {
                self.detailView.frame = CGRect(x: self.view.frame.size.width - self.detailView.frame.size.width, y: self.detailView.frame.origin.y , width: self.detailView.frame.size.width, height: self.detailView.frame.size.height)
                self.performSegue(withIdentifier: "toDescription", sender: UIView())
            }
//            else if {
//                  intentar fer un undwind
//            }
            self.detailView.layoutIfNeeded()
            self.detailView.setNeedsDisplay()
        }
    }
}
