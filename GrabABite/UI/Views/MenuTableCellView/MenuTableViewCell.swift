//
//  MenuTableViewCell.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 22/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemCount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
