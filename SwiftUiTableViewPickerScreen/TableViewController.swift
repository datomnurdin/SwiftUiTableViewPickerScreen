//
//  TableViewController.swift
//  SwiftUiTableViewPickerScreen
//
//  Created by Mohammad Nurdin bin Norazan on 6/25/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var food:String = "Nasi Lemak"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = food
    }
    
    @IBAction func selectedFood(segue:UIStoryboardSegue) {
        if let categoryTableViewController = segue.sourceViewController as? CategoryTableViewController,
            selectedFood = categoryTableViewController.selectedFood {
                detailLabel.text = selectedFood
                food = selectedFood
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PickFood" {
            if let categoryTableViewController = segue.destinationViewController as? CategoryTableViewController {
                categoryTableViewController.selectedFood = food
            }
        }
    }

}
