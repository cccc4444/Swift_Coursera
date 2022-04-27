//
//  DataService.swift
//  storeSwag
//
//  Created by Danylo Kushlianskyi on 27.04.2022.
//

import Foundation

class DataService{
    static let instance = DataService()
    
    private let categories = [
        Categoty(title: "Shirts", imageName: "shirts.png"),
        Categoty(title: "Hoodies", imageName: "hoodies.png"),
        Categoty(title: "Hats", imageName: "hats.png"),
        Categoty(title: "Digital", imageName: "digital.png")]
    
    func getCategories() -> [Categoty]{
        return categories
    }
}
