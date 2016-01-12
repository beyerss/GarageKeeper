//
//  UpdateCarViewController.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

protocol UpdateCarDelegate {
    
    func didUpdateCar(originalCar original: Car?, updatedCar updated: Car)
    
}

class UpdateCarViewController: UIViewController {
    
    var carToUpdate: Car?
    var delegate: UpdateCarDelegate?
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let car = carToUpdate {
            makeTextField.text = car.make
            modelTextField.text = car.model
        }
    }
    
    @IBAction func saveCar(sender: AnyObject) {
        guard let make = makeTextField.text, model = modelTextField.text else {
            let alert = UIAlertController(title: "Inavlid Data", message: "Please review and correct the entered information.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let newCar = Car(make: make, model: model)
        
        delegate?.didUpdateCar(originalCar: carToUpdate, updatedCar: newCar)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
