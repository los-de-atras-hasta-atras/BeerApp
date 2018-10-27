//
//  SearchTextfield.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 26/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import UIKit
@IBDesignable
class SearchTextfield: UITextField {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print("uhuuuuå")
        self.cornerRadius = 5
        self.shadowRadius = 8
        clipsToBounds = false
        autoresizesSubviews = true
        
    }
    

}
