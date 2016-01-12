//
//  Car.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

class Car: NSObject {
    
    var make: String
    var model: String
    
    var name: String {
        get {
            return "\(make) - \(model)"
        }
    }
    
    required init(make: String, model: String) {
        self.make = make
        self.model = model
        
        super.init()
    }

}
