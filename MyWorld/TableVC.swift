//
//  TableVC.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

    let places = PlaceManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: --------------------------------- Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
        let place = places.itemAt(position: indexPath.item)
        
        cell.nameLabel.text = place?.name
        
        return cell
    }
}
