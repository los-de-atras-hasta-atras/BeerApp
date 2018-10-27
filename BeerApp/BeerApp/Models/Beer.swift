//
//  Beer.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation

struct Beer: Codable {
    let id, businessID: Int
    let name, description: String
    let category: String
    let type: String
    let abv, ibu: String?
    let organic: Bool
    let styleName: String
    let labelURL: String?
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case businessID = "business_id"
        case name, description, category, type, abv, ibu, organic
        case styleName = "style_name"
        case labelURL = "label_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


