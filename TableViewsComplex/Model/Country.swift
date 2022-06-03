//
//  Country.swift
//  TableViewsComplex
//
//  Created by Danylo Kushlianskyi on 01.06.2022.
//

import Foundation

class Country {
    var name: String
    var region: String
    var flag: String
    var population: String
    
    init(name: String, region: String, flag: String, population: String) {
        self.region = region
        self.flag = flag
        self.population = population
        self.name = name
    }
    
    
}
