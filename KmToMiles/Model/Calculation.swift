//
//  Calculation.swift
//  KmToMiles
//
//  Created by Danylo Kushlianskyi on 25.04.2022.
//

import Foundation
class Calculation{
    class func calculationsToMiles(kms: Double) -> Double{
        return Double(round(kms * 0.621371192 * 1000)/1000)
    }
    class func calculationsToKms(mls: Double) -> Double{
        return Double(round(mls / 0.621371192 * 1000) / 1000)
    }
}

