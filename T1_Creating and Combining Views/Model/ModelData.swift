//
//  ModelData.swift
//  T1_Creating and Combining Views
//
//  Created by Danylo Kushlianskyi on 31.05.2022.
//

import Foundation

let landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T{
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Could not find \(filename) in the bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    }
    catch{
        fatalError("Could not load \(filename) in the bundle")
    }
    
    do{
        var decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch{
        fatalError("Could not parse \(filename) /n\(error)")
    }
    
}
