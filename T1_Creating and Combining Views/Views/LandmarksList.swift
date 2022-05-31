//
//  LandmarksList.swift
//  T1_Creating and Combining Views
//
//  Created by Danylo Kushlianskyi on 31.05.2022.
//

import SwiftUI

struct LandmarksList: View {
    var body: some View {
        NavigationView{
        List(landmarks){ landmark in
            NavigationLink{
                LandmarkDetail(landmark: landmark)
            }
        label: {
            LandmarkRow(landmark: landmark)
        }
            
        }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksList()
    }
}
