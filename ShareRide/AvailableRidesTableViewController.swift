//
//  AvailableRidesTableViewController.swift
//  ShareRide
//
//  Created by Le, Dung Tien on 4/19/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AvailableRidesTableViewController: UITableViewController {
    
    // MARK: Properties
    var rideItems: [RideInformationItem] = []
    let ref = FIRDatabase.database().reference(withPath: "list-of-rides")
    var selectedItemIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Retrieve the data from Firebase and display it to the tableView
        ref.observe(.value, with: { snapshot in
            var newItems: [RideInformationItem] = []
            
            for item in snapshot.children {
                let rideItem = RideInformationItem(snapshot: item as! FIRDataSnapshot)
                newItems.append(rideItem)
            }
            
            self.rideItems = newItems
            self.tableView.reloadData()
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableView Delegate and Data Source methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rideItems.count
    }

    // choosing the table view cell pressed
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItemIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rideDetailsSegue" {
            let controller = segue.destination as! RideDetailsViewController
            controller.selectedItem = [rideItems[selectedItemIndex]]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availableRideCell", for: indexPath) as! AvailableRidesCell
        let rideInfoItem = rideItems[indexPath.row]

        cell.destinationLabel.text = rideInfoItem.departure + " to " + rideInfoItem.arrival
        cell.dateTimeLabel.text = rideInfoItem.date + " - " + rideInfoItem.time
        cell.seatsAvailLabel.text = String(rideInfoItem.seatsAvailable) + " seats avail"

        return cell
    }

    
    
    
    @IBAction func availableRidesBackAction(_ sender: Any) {
        performSegue(withIdentifier: "availableRidesBackSegue", sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
