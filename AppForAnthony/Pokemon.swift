//
//  Pokemon.swift
//  AppForAnthony
//
//  Created by Carlos Carrillo on 8/23/17.
//  Copyright © 2017 Carlos Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

enum PokemonError:Error {
    case NoPokemonId
    case NoPokemonName
    case NoPokemonUrl
    case NoPokemonHeight
    case NoPokemonWeight
    case NoPokemonBaseExperience
}

extension PokemonError:LocalizedError {
    public var errorDescription:String?{
        switch self {
        case .NoPokemonId:
            return NSLocalizedString("No Pokemon id", comment: "Json did not have id")
        case .NoPokemonUrl:
            return NSLocalizedString("No Pokemon url", comment: "Json did not have url")
        case .NoPokemonName:
            return NSLocalizedString("No Pokemon Name", comment: "Json did not have name")
        case .NoPokemonHeight:
            return NSLocalizedString("No Pokemon Height", comment: "Json did not have Height")
        case .NoPokemonWeight:
            return NSLocalizedString("No Pokemon Weight", comment: "Json did not have Weight")
        case .NoPokemonBaseExperience:
            return NSLocalizedString("No Pokemon BaseExperience", comment: "Json did not have BaseExperience")
        }
    }
}

class Pokemon {
    let url:String?
    let name:String?
    
    init(dict:[String:Any]) throws {
        guard let urlIn = dict["url"] as? String else {
            throw PokemonError.NoPokemonUrl
        }
        self.url = urlIn
        print("URL: ", urlIn)
        
        guard let nameIn = dict["name"] as? String else {
            throw PokemonError.NoPokemonName
        }
        self.name = nameIn
        print("NAME: ",nameIn)
    }
}

class PokemonFeatures {
    let stat:String
    let name:String
    let height:String
    let weight:String
    let base_experience:String
    
    init(dict:[String:Any]) throws {
//        guard let idIn = dict["id"] as? Int else {
//            throw PokemonError.NoPokemonId
//        }
//        let idOut = "id: \(idIn)"
//        self.id = idOut
//        print("POKEMON1: ",idOut)
       
        guard let nameIn = dict["name"] as? String else {
            throw PokemonError.NoPokemonName
        }
        let nameOut = "Name: \(nameIn)"
        self.name = nameOut
        print("POKEMON2: ",nameOut)
        
        guard let heightIn = dict["height"] as? Int else {
            throw PokemonError.NoPokemonHeight
        }
        let heightOut = "Height: \(heightIn)"
        self.height = heightOut
        print("POKEMON3: ", heightOut)
        
        guard let weightIn = dict["weight"] as? Int else {
            throw PokemonError.NoPokemonWeight
        }
        let weightOut = "Weight: \(weightIn)"
        self.weight = weightOut
        print("POKEMON4: ",weightOut)
        
        guard let baseExperience = dict["base_experience"] as? Int else {
            throw PokemonError.NoPokemonBaseExperience
        }
        let baseExperienceOut = "Base Experience: \(baseExperience)"
        self.base_experience = baseExperienceOut
        print("POKEMON5: ",baseExperienceOut)
        
        
        
        
        guard let statArray = dict["stats"] as? [[String:Any]] else {
            throw PokemonError.NoPokemonBaseExperience
        }
        //let stat = statArray.flatMap{$0["name"] as? [String]}
        let statName = statArray.flatMap{$0["name"] as? [String]}
        //let statName = statArray.filter{$0.contains("name")}
       
        //let statOut = "Stat: \(statName)"
        self.stat = "statOut"
        print("POKEMON_TEST: ",statName)
        
    }
    
}
 



