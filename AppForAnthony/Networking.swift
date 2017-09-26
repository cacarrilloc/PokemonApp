//
//  Networking.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class NetWorking {
    // Get pokemon name and url
    static func getNames(limit:Int, completion:@escaping (Error?, Data?)->()){
        let url = "http://pokeapi.co/api/v2/pokemon/?limit=\(limit)"
        Alamofire.request(url, method: .get).responseString { response in
            guard let data = response.data else {return}
            completion(response.error, data)
        }
    }
    
    // Get Pokemon Features
    static func getFeautures(url:String, completion:@escaping (Error?, Data?) -> ()){
        Alamofire.request(url, method: .get).responseString { response in
            guard let data = response.data else {return}
            completion(response.error, data)
        }
    }
    
    // Get Card Image
    static func getImage(url:String, forObject:UIImageView? = nil, completion:@escaping(Error?, UIImage?)->()){
        Alamofire.request(url, method: .get).responseData { response in
            guard let image = response.data else {return}
            DispatchQueue.main.async {
                guard let image = UIImage(data: image) else {return}
                ImageCache.shared.cache.setObject(image, forKey: url as NSString)
                completion(nil, image)
                print("Picture downloaded.")
            }
        }
    }
    deinit {
        print("got removed from the app")
    }
}


