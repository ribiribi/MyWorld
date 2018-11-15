//
//  EditVC.swift
//  MyWorld
//
//  Created by user143594 on 11/15/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class EditVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var nameEdit: UITextField!
    
    var toNameEdit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameEdit.text = toNameEdit
       

    }
    internal func textViewDidChange(_ textView: UITextView){
        print ("Changed")
        print (" ")
    }

}
