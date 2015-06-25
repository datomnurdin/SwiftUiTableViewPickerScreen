//
//  CategoryTableViewController.swift
//  SwiftUiTableViewPickerScreen
//
//  Created by Mohammad Nurdin bin Norazan on 6/25/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var foods:[String]!
    var selectedFood:String? = nil
    var selectedFoodIndex:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foods = ["Nasi Lemak",
            "Nasi Ayam",
            "KFC",
            "MCD"]
        
        if let food = selectedFood {
            selectedFoodIndex = find(foods, food)!
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return foods.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = foods[indexPath.row]
        
        if indexPath.row == selectedFoodIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedFoodIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedFoodIndex = indexPath.row
        selectedFood = foods[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedFood" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                selectedFoodIndex = indexPath?.row
                if let index = selectedFoodIndex {
                    selectedFood = foods[index]
                }
            }
        }
    }
    
}
