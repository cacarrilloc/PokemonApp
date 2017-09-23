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
    
    func triggerDisplayInfo () {
        ViewController1?.getPokemonNames(string: "Display Info")
    }
}







