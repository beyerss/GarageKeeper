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
    
    init?(name: String?, capacity: Int?) {
        self.name =  "default"
        self.capacity = 1
        
        super.init()
        
        guard let name = name, capacity = capacity else { return nil }
        
        if (name.isEmpty) {
            return nil
        }
        
        if (capacity < 1) {
            return nil
        }
        
        self.name = name
        self.capacity = capacity
    }

}
