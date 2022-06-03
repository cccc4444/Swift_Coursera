//
//  CountryCell.swift
//  TableViewsComplex
//
//  Created by Danylo Kushlianskyi on 01.06.2022.
//

import Foundation
class CountryBatch{
    var counries: [Country] = [
        Country(name: "Belgium", region: "Europe", flag: "🇧🇪", population: "1.2M"),
        Country(name: "Ukraine", region: "Europe", flag: "🇺🇦", population: "42M"),
        Country(name: "USA", region: "Somewhere on the West", flag: "🇧🇪", population: "200+M")
    ]
    
    static func getCountries() -> CountryBatch{
        return CountryBatch()
    }
}
