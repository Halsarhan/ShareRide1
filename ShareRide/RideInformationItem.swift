//
//  RideInformationItem.swift
//  ShareRide
//
//  Created by Le, Dung Tien on 4/19/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct RideInformationItem {
    
    let ref: FIRDatabaseReference?
    let key: String
    
    let departure: String
    let arrival: String
    let date: String
    let time: String
    let seatsAvailable: Int
    
    let driverName: String
    let driverEmail: String
    
    init(departure: String, arrival: String, date: String, time: String, seatsAvailable: Int,
         key: String = "", driverName: String, driverEmail: String) {
        self.key = key
        self.driverName = driverName
        self.driverEmail = driverEmail
        self.departure = departure
        self.arrival = arrival
        self.date = date
        self.time = time
        self.seatsAvailable = seatsAvailable
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        driverName = snapshotValue["driverName"] as! String
        driverEmail = snapshotValue["driverEmail"] as! String
        departure = snapshotValue["departure"] as! String
        arrival = snapshotValue["arrival"] as! String
        date = snapshotValue["date"] as! String
        time = snapshotValue["time"] as! String
        seatsAvailable = snapshotValue["seatsAvailable"] as! Int
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "driverName": driverName,
            "driverEmail": driverEmail,
            "departure": departure,
            "arrival": arrival,
            "date": date,
            "time": time,
            "seatsAvailable": seatsAvailable
        ]
    }
}
