//
//  TableVC.swift
//  DCLandmarks
//
//  Created by Terrell Robinson on 11/18/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

    var imageList = ["WhiteHouse.jpg", "NationalMall.jpg", "Monument.jpg", "Lincoln.jpg", "WW2Memorial.jpg", "Capitol.jpg"]
    var titleList = ["White House", "National Mall", "Washington Monument", "Lincoln Memorial", "World War 2 Memorial", "The United States Capitol"]
    
    var descriptionList = ["1600 Pennsylvania Ave NW", "Washington, DC 20565", "2 15th St NW", "2 Lincoln Memorial Cir NW", "Washington, DC 20006", "East Capitol St NE & First St SE"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return titleList.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell // references the class

        // Configure the cell...
        
        cell.cellTitle.text = titleList[indexPath.row] // puts title in row format
        cell.cellDescription.text = descriptionList[indexPath.row] // puts description in row format
        
        cell.cellImageView.image = UIImage(named: imageList[indexPath.row])

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showDetail") {
            
            let detailsVC = segue.destination as! DetailsVC
            
            if let indexpath = self.tableView.indexPathForSelectedRow {
                
                let title = titleList[indexpath.row] as String
                detailsVC.sentDataOne = title
                
                let description = descriptionList[indexpath.row] as String
                detailsVC.sentDataTwo = description
                
                let image = imageList[indexpath.row] as String
                detailsVC.sentDataThree = image
                
            }
            
        }
        
    }
 
}
