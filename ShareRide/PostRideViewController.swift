//
//  PostRideViewController.swift
//  ShareRide
//
//  Created by Le, Dung Tien on 4/19/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostRideViewController: UIViewController {

    @IBOutlet weak var departureTextField: UITextField!
    @IBOutlet weak var arrivalTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var seatsAvailTextField: UITextField!
    
    // MARK: Properties
    let ref = FIRDatabase.database().reference(withPath: "list-of-rides")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postRideAction(_ sender: Any) {
        if (departureTextField.text == "" || arrivalTextField.text == "" || dateTextField.text == "" || timeTextField.text == "" || seatsAvailTextField.text == "") {
            let alertController = UIAlertController(title: "Error", message: "Please fill out every field", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {

            let rideInformationItem = RideInformationItem(departure: departureTextField.text!, arrival: arrivalTextField.text!, date: dateTextField.text!, time: timeTextField.text!, seatsAvailable: Int(seatsAvailTextField.text!)!, driverName: "Dung Le", driverEmail: "dle@middlebury.edu")
        
            let rideInformationItemRef = self.ref.child(departureTextField.text! + " to " + arrivalTextField.text!)
            rideInformationItemRef.setValue(rideInformationItem.toAnyObject())
        }
        //Tells the user that there is an error and then gets firebase to tell them the error
        let alertController = UIAlertController(title: "Ride Posted", message: "You have successully posted a ride! \n Thank you", preferredStyle: .alert)
        
        let postAnotherRideAction = UIAlertAction(title: "Post Another Ride", style: .default, handler: {action in self.performSegue(withIdentifier: "postAnotherRideSegue", sender: self)})
        let goToActivityAction = UIAlertAction(title: "Go to Recent Activity", style: .default, handler: {action in self.performSegue(withIdentifier: "goToActivitySegue", sender: self)})
        
        alertController.addAction(postAnotherRideAction)
        alertController.addAction(goToActivityAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    

    @IBAction func postRideBackAction(_ sender: Any) {
        performSegue(withIdentifier: "postRideBackSegue", sender: nil)
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
