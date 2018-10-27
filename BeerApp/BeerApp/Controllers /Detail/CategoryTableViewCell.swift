//
//  CategoryTableViewCell.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate:AnyObject{
    func addCategoryToOrder(cell:CategoryTableViewCell)
}

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: CategoryTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addButton.addTarget(self, action: #selector(btnAddToOrder(sender:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func btnAddToOrder(sender:UIButton){
    
        delegate?.addCategoryToOrder(cell: self)
    }

}
