//
//  Landmark.swift
//  T1_Creating and Combining Views
//
//  Created by Danylo Kushlianskyi on 31.05.2022.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark: Codable, Hashable, Identifiable {
    // identifiable is used to be put in the table
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    
    var image: Image {
        return Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Codable, Hashable {
        var longitude: Double
        var latitude: Double
    }
    
}
