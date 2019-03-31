//
//  RestaurantTableViewCell.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 12/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var ivRestaurant: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
