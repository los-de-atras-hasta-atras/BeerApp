//
//  RESTClient.swift
//  BeerApp
//
//  Created by José Gil Ramírez S on 26/10/18.
//  Copyright © 2018 Los De Atras Hasta Atras. All rights reserved.
//

import Foundation

typealias dataHandler = (Data?) -> Void

struct RESTClient {
    let baseURLComponents: URLComponents
    
    func get(path: String, successHandler: dataHandler?) {
        print("Obteniendo datos del servicio")
        get(path: path, body: nil, successHandler: successHandler)
    }
    
    func get(path: String, body: Data?, successHandler: dataHandler?) {
        request("GET", path: path, body: body, successHandler: successHandler)
    }
    
    func post(path: String, body: Data?, successHandler: dataHandler?) {
        request("POST", path: path, body: body, successHandler: successHandler)
    }
    
    func put(path: String, body: Data?, successHandler: dataHandler?) {
        request("PUT", path: path, body: body, successHandler: successHandler)
    }
    
    func patch(path: String, body: Data?, successHandler: dataHandler?) {
        request("PATCH", path: path, body: body, successHandler: successHandler)
    }
    
    func delete(path: String, successHandler: dataHandler?) {
        delete(path: path, body: nil, successHandler: successHandler)
    }
    
    func delete(path: String, body: Data?, successHandler: dataHandler?) {
        request("DELETE", path: path, body: body, successHandler: successHandler)
    }
    
    func request(_ method: String, path: String, body: Data?, successHandler: dataHandler?) {
        var requestURLComponents = baseURLComponents
        requestURLComponents.path = path
        var request = URLRequest(url: requestURLComponents.url!)
        request.httpMethod = method
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil { return }
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200, let handler = successHandler {
                handler(data)
            }
        }
        task.resume()
    }
}
