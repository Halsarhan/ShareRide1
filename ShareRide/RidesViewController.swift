//
//  RidesViewController.swift
//  ShareRide
//
//  Created by Le, Dung Tien on 4/19/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController {

    @IBOutlet weak var availableRidesImage: UIImageView!
    @IBOutlet weak var postRideImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(RidesViewController.image1Tapped(gesture:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(RidesViewController.image2Tapped(gesture:)))
        
        // add it to the image view;
        availableRidesImage.addGestureRecognizer(tapGesture1)
        postRideImage.addGestureRecognizer(tapGesture2)
        // make sure imageView can be interacted with by user
        availableRidesImage.isUserInteractionEnabled = true
        postRideImage.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func image1Tapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Initiate your new ViewController
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "availableRides")
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func image2Tapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Initiate your new ViewController
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "postARide")
            self.present(vc!, animated: true, completion: nil)
        }
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
