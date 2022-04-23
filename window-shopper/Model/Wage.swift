//
//  Wage.swift
//  window-shopper
//
//  Created by Danylo Kushlianskyi on 23.04.2022.
//

import Foundation

public class Wage{
    class func getHours(forWage wage: Double, forPrice price: Double) -> Int{
         return Int(ceil(price/wage))
    }
}

