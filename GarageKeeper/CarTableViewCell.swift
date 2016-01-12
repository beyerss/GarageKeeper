//
//  CarTableViewCell.swift
//  GarageKeeper
//
//  Created by Steven Beyers on 1/12/16.
//  Copyright © 2016 CapTech. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showEmptySlot() {
        name.textColor = UIColor.grayColor()
        name.text = "Empty"
    }
    
    func setCarName(name: String) {
        self.name.textColor = UIColor.blackColor()
        self.name.text = name
    }

}
