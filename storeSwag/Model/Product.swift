//
//  Product.swift
//  storeSwag
//
//  Created by Danylo Kushlianskyi on 29.04.2022.
//

import Foundation

struct Product{
    
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price:String, imageName:String) {
        self.imageName = imageName
        self.title = title
        self.price = price
    }
}
