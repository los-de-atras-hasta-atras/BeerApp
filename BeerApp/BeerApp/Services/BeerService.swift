//
//  BeerService.swift
//  BeerApp
//
//  Created by Angel Ricardo Solsona Nevero on 27/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation


class BeerService{

    static let sharedInstance = BeerService()
    let client = RESTClient(baseURLComponents: URLComponents(string: "https://opentab.herokuapp.com")!)
    func all(completion: @escaping ([Beer]) -> Void){
        
        client.get(path: "/api/v1/business/1/beers") { (data) in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Beer].self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            }catch let error{
                debugPrint(error)
            }
        }
    }
}
