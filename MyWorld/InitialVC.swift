//
//  InitialVC.swift
//  MyWorld
//
//  Created by user143594 on 12/10/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit


class InitialVC: UIViewController {

    
    @IBOutlet weak var imageInitialVC: UIImageView!
    @IBOutlet weak var blureView: UIVisualEffectView!
    @IBOutlet weak var welcomeLAbel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //self.welcomeLAbel.font = UIFont.boldSystemFont(ofSize:45)

        //let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            //self.blureView.isHidden = false
//        UIView.transition(with: view, duration: 2, options: .transitionCrossDissolve, animations: {
//            //
//            self.blureView.isHidden = false
//            self.welcomeLAbel.isHidden = false
//        })
        
            
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            
            UIView.animate(withDuration: 2, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.welcomeLAbel.alpha = 1
                self.blureView.alpha = 0.8
                
            }, completion: nil)
        }

        
    }
}
