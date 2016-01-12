//
//  AddGarageViewController.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

protocol AddGarageDelegate {
    func didCreateGarage(garage: Garage)
}

class AddGarageViewController: UIViewController {

    @IBOutlet weak var garageNameTextField: UITextField!
    @IBOutlet weak var capcityTextField: UITextField!
    
    var delegate: AddGarageDelegate?

    @IBAction func save(sender: AnyObject) {
        guard let name = garageNameTextField.text, capacityText = capcityTextField.text, capacity = Int(capacityText) else {
            let alert = UIAlertController(title: "Inavlid Data", message: "Please review and correct the entered information.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let garage = Garage(name: name, capacity: capacity)
        
        delegate?.didCreateGarage(garage)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
