//
//  Business.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation
struct Business: Codable {
    let id: Int
    let name: String
    let location: String
    let latitude: Double
    let longitude: Double
    let currency: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, latitude, longitude, currency
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
