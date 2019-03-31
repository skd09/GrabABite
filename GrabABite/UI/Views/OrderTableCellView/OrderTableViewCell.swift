//
//  OrderTableViewCell.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 20/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblItemName: UILabel!;
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
