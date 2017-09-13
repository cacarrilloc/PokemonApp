//
//  Networking.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit

class NetWorking {
    
    // Get pokemon name and url
    static func getNames(limit:Int, completion:@escaping (Error?, Data?)->()){
        let session = URLSession.shared
        guard let url = URL(string: "http://pokeapi.co/api/v2/pokemon/?limit=\(limit)") else {return}
        let task = session.dataTask(with: url) {(data, response, error) in
            guard error == nil else {
                completion(error!, nil)
                print(error!.localizedDescription)
                return
            }
            guard let dataIn = data else {return}
            completion(nil, dataIn)
        }
        task.resume()
    }
    
    // Get Pokemon Features
    static func getFeautures(url:String, completion:@escaping (Error?, Data?) -> ()){
        let session = URLSession.shared
        guard let url = URL(string: url) else {return}
        let task = session.dataTask(with: url) {(data, response, error) in
            guard error == nil else {
                completion(error!, nil)
                print(error!.localizedDescription)
                return
            }
            guard let dataIn = data else {return}
            completion(nil, dataIn)
        }
        task.resume()
    }
    
    // Get Card Image
    static func getImage(url:String, forObject:UIImageView? = nil, completion:@escaping(Error?, UIImage?)->()){
        print("downloading picture")
        guard let uUrl = URL(string: url) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: uUrl){
            (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let datos = data else {
                print ("Error: No data in call!")
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: datos) else {return}
                ImageCache.shared.cache.setObject(image, forKey: url as NSString)
                completion(nil, image)
            }
        }
        task.resume()
    }
    deinit {
        print("got removed from the app")
    }
}


