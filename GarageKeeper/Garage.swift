//
//  Garage.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

class Garage: NSObject {
    
    var name: String
    var capacity: Int
    var cars = [Car]()
    
    convenience init(name: String, capacity: Int) {
        self.init()
        
        self.name = name
        self.capacity = capacity
    }
    
    override init() {
        self.name = "default"
        self.capacity = 1
        
        super.init()
    }

}
