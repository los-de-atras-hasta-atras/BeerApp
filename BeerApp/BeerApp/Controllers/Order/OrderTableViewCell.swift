//
//  OrderTableViewCell.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerCategory: UILabel!
    @IBOutlet weak var beerNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
