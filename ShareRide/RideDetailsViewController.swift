//
//  RideDetailsViewController.swift
//  ShareRide
//
//  Created by Le, Dung Tien on 4/19/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RideDetailsViewController: UIViewController {

    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsAvailLabel: UILabel!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverEmailLabel: UILabel!
    
    // MARK: Properties
    let ref = FIRDatabase.database().reference(withPath: "list-of-rides")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref.observe(.value, with: { snapshot in
            for item in snapshot.children {
                // display departure
                let departure = RideInformationItem(snapshot: item as! FIRDataSnapshot).departure
                self.departureLabel.text = departure
                // display arrival
                let arrival = RideInformationItem(snapshot: item as! FIRDataSnapshot).arrival
                self.arrivalLabel.text = arrival
                // display time
                let time = RideInformationItem(snapshot: item as! FIRDataSnapshot).time
                self.timeLabel.text = time
                // display date
                let date = RideInformationItem(snapshot: item as! FIRDataSnapshot).date
                self.dateLabel.text = date
                // display seats available
                let seatsAvail = RideInformationItem(snapshot: item as! FIRDataSnapshot).seatsAvailable
                self.seatsAvailLabel.text = String(seatsAvail) + " seats"
                // display driver's name
                let driverName = RideInformationItem(snapshot: item as! FIRDataSnapshot).driverName
                self.driverNameLabel.text = driverName
                // display driver's email
                let driverEmail = RideInformationItem(snapshot: item as! FIRDataSnapshot).driverEmail
                self.driverEmailLabel.text = driverEmail
            }
        })
    }

    
    
    @IBAction func rideDetailsBackAction(_ sender: Any) {
        performSegue(withIdentifier: "rideDetailsBackSegue", sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
