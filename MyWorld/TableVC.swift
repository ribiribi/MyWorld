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
    var refresh = false
    
    
    //MARK: -----------------------------------Refresh
    override func viewDidAppear(_ animated: Bool){
        if refresh == true {
            self.tableView.reloadData()
        }
    }
    
    // MARK: --------------------------------- Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
        let place = places.itemAt(position: indexPath.item)
        
        cell.nameLabel.text = place?.name
        cell.iconTable.image = UIImage(named: (place?.iconTable)!)
        
        refresh = true        
        return cell
    }
    
    // MARK: --------------------------------- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let cell = sender as! PlaceCell
            let index = tableView.indexPath(for: cell)!.row
            //let place = places.someTestPlaces[index]
            let place = places.places[index]
            let elementDetailVC = segue.destination as! DetailVC
            elementDetailVC.place = place
        }
    }
    

    
//    //MARK: -----------------------------------Long Press
//    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
//        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
//            let touchPoint = longPressGestureRecognizer.location(in: self.view)
//            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
//                
//                let alert = UIAlertController(title: "UIAlertController", message: "Estas segur eque vols sborrar la localització seleccionada?", preferredStyle: UIAlertController.Style.alert)
//
//                let accept = UIAlertAction(title: "Esborrar localització", style: UIAlertAction.Style.default) { (action) in
//                    self.places.removeFromPosition(indexPath.item)
//                    self.places.saveJsonToFile(origin: self.places.places)
//                    self.tableView.reloadData()
//                }
//                
//                let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action) in
//                    print("Blue action button tapped")
//                }
//                
//                alert.addAction(accept)
//                alert.addAction(cancel)
//                
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
//    }
}
