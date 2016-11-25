//
//  DetailsVC.swift
//  DCLandmarks
//
//  Created by Terrell Robinson on 11/19/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsDescription: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var detailsMapView: MKMapView!
    @IBOutlet weak var directionsButton: UIButton!
    
    var sentDataOne: String!
    var sentDataTwo: String!
    var sentDataThree: String!
    
    var latitude = 0.0
    var longitude = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsTitle.text = sentDataOne
        
        detailsDescription.text = sentDataTwo
        
        detailsImageView.image = UIImage(named: sentDataThree)
        
        populateData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func directionsButtonPressed(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longitude)")!) // Launches Apple Maps
        
        
    }
    
    
    
    // Helper Methods
    
    
    
    func populateData() {
        
        self.navigationItem.title = sentDataOne
        
        if detailsTitle.text == "White House" {
            
            detailsTextView.text = "The White House is the official residence and principal workplace of the President of the United States, located at 1600 Pennsylvania Avenue NW in Washington, D.C. It has been the residence of every U.S. president since John Adams in 1800."
            
            latitude = 38.897609
            longitude = -77.036735
            
            
        }
        
        if detailsTitle.text == "National Mall" {
            
            detailsTextView.text = "The National Mall is a national park in downtown Washington, D.C.. The National Park Service (NPS) administers the National Mall, which is part of its National Mall and Memorial Parks unit. The term National Mall commonly includes areas that are officially part of West Potomac Park and Constitution Gardens to the west, and often is referred to as the entire area between the Lincoln Memorial and the United States Capitol, with the Washington Monument dividing the area slightly west of its midpoint. The National Mall contains a number of museums and memorials and receives approximately 24 million visitors each year."
            
            latitude = 38.8896198
            longitude = -77.022977
            
        }
        
        if detailsTitle.text == "Washington Monument" {
            
            detailsTextView.text = "The Washington Monument is an obelisk on the National Mall in Washington, D.C., built to commemorate George Washington, once commander-in-chief of the Continental Army and the first American president."
            
            latitude = 38.889484
            longitude = -77.035279
            
        }
        
        if detailsTitle.text == "Lincoln Memorial" {
            
            detailsTextView.text = "The Lincoln Memorial is a Parthenon-inspired tribute to Abraham Lincoln with a 19-ft. marble statue, murals & reflecting pool."
            
            latitude = 38.889269
            longitude = -77.050176
            
        }
        
        if detailsTitle.text == "World War 2 Memorial" {
            
            detailsTextView.text = "The World War II Memorial honors the 16 million who served in the armed forces of the U.S., the more than 400,000 who died, and all who supported the war effort from home. Symbolic of the defining event of the 20th Century, the memorial is a monument to the spirit, sacrifice, and commitment of the American people. The Second World War is the only 20th Century event commemorated on the National Mall’s central axis."
            
            latitude = 38.888807
            longitude = -77.039527

            
        }
        
        if detailsTitle.text == "The United States Capitol" {
            
            detailsTextView.text = "The United States Capitol, often called the Capitol Building or Capitol Hill, is the seat of the United States Congress, the legislative branch of the U.S. federal government."
            
            latitude = 38.889939
            longitude = -77.009051
            
        }
        
        // MapView
        
        let span = MKCoordinateSpanMake(0.003, 0.003)
        let region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(latitude, longitude), span)
        detailsMapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = detailsTitle.text
        objectAnnotation.subtitle = detailsDescription.text
        self.detailsMapView.addAnnotation(objectAnnotation)
        
        
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
