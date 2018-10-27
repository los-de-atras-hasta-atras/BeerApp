//
//  ProductService.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation

class ProductService {
    static let sharedInstance = ProductService()
    let client = RESTClient(baseURLComponents: URLComponents(string: "https://opentab.herokuapp.com")!)
    
    func all(completion: @escaping ([Product]) -> Void){
        
        client.get(path: "/api/v1/business/1/products") { (data) in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            }catch let error{
                debugPrint(error)
            }
        }
    }
}
