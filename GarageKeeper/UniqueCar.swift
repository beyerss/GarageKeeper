//
//  UniqueCar.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

class UniqueCar: Car {

    required init(make: String, model: String) {
        super.init(make: make, model: model)
        
        if (make == "Polaris" && model == "Slingshot") {
            wheels = 3
        }
    }

}
