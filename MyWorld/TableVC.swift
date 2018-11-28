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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //long press recognizer
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        tableView.addGestureRecognizer(longPress)
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
    //MARK: -----------------------------------Refresh
    override func viewDidAppear(_ animated: Bool){
        if refresh == true {
            self.tableView.reloadData()
        }
    }
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {

        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            print ("long press")
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {

                // your code here, get the row for the indexPath or do whatever you want
            }
        }
    }
}
