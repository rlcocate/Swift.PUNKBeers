//
//  REST.swift
//  RM30902
//
//  Created by Rodrigo on 30/11/17.
//  Copyright © 2017 Rodrigo Cocate. All rights reserved.
//

import Foundation

class REST {
    
    static let apiPath = "https://api.punkapi.com/v2/beers"
    
    static let session = URLSession(configuration: sessionConfig)
    
    static let sessionConfig : URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.allowsCellularAccess = true
        config.httpMaximumConnectionsPerHost = 5
        config.timeoutIntervalForRequest = 30.0
        
        return config
        
    }()
    
    static func getAllBeers(onComplete: @escaping ([Beer]?) -> Void) {
    
        guard let url = URL(string: apiPath) else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200 {
                    
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                   
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String:Any]]
                    
                    var beers : [Beer] = []
                    
                    for item in json {
                        
                        let name = item["name"] as! String
                        let tagline = item["tagline"] as! String
                        let description = item["description"] as! String
                        let abv = item["abv"] as? Double ?? 0.0
                        let ibu = item["ibu"] as? Double ?? 0.0
                        let image_url = item["image_url"] as! String
                        
                        let beer = Beer(name: name, tagline: tagline, description: description, abv: abv, ibu: ibu, image_url: image_url)
                        
                        beer._id = item["id"] as? Int
                        
                        beers.append(beer)
                        
                    }
                    
                    onComplete(beers)
                } else {
                    onComplete(nil)
                }
            }
            
        }.resume()
    }
}
