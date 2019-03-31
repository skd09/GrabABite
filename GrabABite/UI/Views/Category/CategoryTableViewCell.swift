//
//  CategoryTableViewCell.swift
//  GrabABite
//
//  Created by Sharvari Divekar on 25/03/19.
//  Copyright © 2019 Sharvari Divekar. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
