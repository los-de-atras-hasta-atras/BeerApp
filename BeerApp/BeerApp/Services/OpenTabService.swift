//
//  OpenTabService.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 26/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation

class OpenTabService {
    static let shared = OpenTabService()
    let client = RESTClient(baseURLComponents: URLComponents(string: "https://worldb.herokuapp.com/api/v1")!)

}
