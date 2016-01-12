//
//  ViewController.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var garageList = [Garage]()
    private var garageBeingEdited: Garage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let addGarageBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addGarage"))
        navigationItem.rightBarButtonItem = addGarageBtn
    }
    
    func addGarage() {
        performSegueWithIdentifier("addGarageSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let addGarageVC = segue.destinationViewController as? AddGarageViewController {
            addGarageVC.delegate = self
        } else if let updateCarVC = segue.destinationViewController as? UpdateCarViewController, cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
            garageBeingEdited = garageList[indexPath.section]
            if (garageBeingEdited?.cars.count > indexPath.row) {
                updateCarVC.carToUpdate = garageBeingEdited?.cars[indexPath.row]
            }
            updateCarVC.delegate = self
        }
    }

}

extension ViewController: AddGarageDelegate {
    
    func didCreateGarage(garage: Garage) {
        garageList.append(garage)
        tableView.reloadData()
    }
    
}

extension ViewController: UpdateCarDelegate {
    
    func didUpdateCar(originalCar original: Car?, updatedCar updated: Car) {
        if let original = original {
            if let carIndex = garageBeingEdited?.cars.indexOf(original) {
                garageBeingEdited?.cars[carIndex] = updated
            }
        } else {
            garageBeingEdited?.cars.append(updated)
        }
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return garageList.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let garage = garageList[section]
        return garage.name
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garageList[section].capacity
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("CarCell") as? CarTableViewCell {
            
            let carList = garageList[indexPath.section].cars
            
            if (carList.count > indexPath.row) {
                // we have a car
                cell.setCarName(carList[indexPath.row].name)
            } else {
                // this slot in the garage is empty
                cell.showEmptySlot()
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
