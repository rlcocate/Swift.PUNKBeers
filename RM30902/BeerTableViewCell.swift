//
//  BeerTableViewCell.swift
//  RM30902
//
//  Created by Rodrigo on 01/12/17.
//  Copyright © 2017 Rodrigo Cocate. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbABV: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
