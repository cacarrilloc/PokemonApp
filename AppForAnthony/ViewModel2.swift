//
//  ViewModel2.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 9/10/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol VMDelegate2:class{
    func updateTable()
}

class ViewModel2 {
    
    var masterArray:[Pokemon]?
    weak var ViewController2:VMDelegate2?
    
    init(delegate:VMDelegate2? = nil){
        self.ViewController2 = delegate
    }
    
    func getPokemons(inputValue: Int) {
        NetWorking.getNames(limit: inputValue){
            [unowned self] (error, data) in
            guard error == nil else {return}
            guard let pokemons = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: pokemons)
                guard let dict = json as? [String:Any] else {return}
                guard let results = dict["results"] as? [[String:Any]] else {return}
                let pokeArray:[Pokemon] = results.flatMap{ try? Pokemon(dict: $0)}
                self.masterArray = pokeArray
                self.ViewController2?.updateTable()
                
            }catch let error{
                print(error.localizedDescription)
            }
        }
        print ("getPokemonNames")
    }
    
    func getCounter() -> Int {
        guard let counter = masterArray?.count else {return 0}
        return counter
    }
    
    func getName(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let name = array.flatMap{$0.name}
        return name[index]
    }
    
    func getUrl(index:Int) -> String {
        guard let array = masterArray else {return "ERROR"}
        let desc = array.flatMap{$0.url}
        return desc[index]
    }
}



