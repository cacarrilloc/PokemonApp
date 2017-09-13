//
//  ViewModel3.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 9/11/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate3:class{
    func passPokemonFeatures(array: [PokemonFeatures], image: UIImage)
}

class ViewModel3 {
    
    var masterArray:[PokemonFeatures] = []
    weak var ViewController3:VMDelegate3?
    
    init(delegate:VMDelegate3? = nil){
        self.ViewController3 = delegate
    }
    
    func getPokemonFeatures(inputUrl: String, index: Int) {
        NetWorking.getFeautures(url: inputUrl){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let pokemons = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: pokemons)
                guard let dictionary = json as? [String:Any] else {return}
                guard let pokeArray = try? PokemonFeatures(dict: dictionary) else {return}
                self.masterArray = [pokeArray]
                self.getPokemonImage(indexIn: index)
            }catch let error{
                print(error.localizedDescription)
            }
        }
        print ("getPokemonFeautures")
    }
    
    func getPokemonImage(indexIn:Int) {
        NetWorking.getImage(url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexIn + 1).png") {
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let dataIn = data else {return}
            self.ViewController3?.passPokemonFeatures(array: self.masterArray, image: dataIn)
        }
    }
    
    func getCounter() -> Int {
        return masterArray.count
    }
    
    func getName(index:Int) -> String {
        let name = masterArray.flatMap{$0.name}
        return name[index]
    }
}





