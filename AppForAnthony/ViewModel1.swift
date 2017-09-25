//
//  ViewModel.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate1:class{
    func getPokemonNames(string: String)
}

class ViewModel1 {
    
    var pokemons:[Pokemon]?
    weak var ViewController1:VMDelegate1?
    
    init(delegate:VMDelegate1? = nil){
        self.ViewController1 = delegate
    }
    
    func getImage(pokeNumber:Int) {
        for urlIndex in 1...pokeNumber {
            let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(urlIndex).png"
            if let image = ImageCache.shared.cache.object(forKey: imageUrl as NSString){
                print("image already stored")
            } else {
                NetWorking.getImage(url: imageUrl){
                    [unowned self] (error, data) in
                    guard error == nil else {return}
                    guard data != nil else {return}
                    print("calling new image url")
                }
            }
        }
    }
    
    func triggerDisplayInfo () {
        ViewController1?.getPokemonNames(string: "Display Info")
    }
}







