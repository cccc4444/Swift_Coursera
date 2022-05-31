//
//  LandmarkDetail.swift
//  T1_Creating and Combining Views
//
//  Created by Danylo Kushlianskyi on 31.05.2022.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                          .ignoresSafeArea(edges: .top)
                          .frame(height: 300)

            CircleImage(image: landmark.image)
                          .offset(y: -130)
                          .padding(.bottom, -130)
            
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                Divider()
                VStack(alignment: .leading){
                    Text(landmark.name).font(.headline)
                    Text(landmark.description)
                        .font(.subheadline)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
                
            }
            .padding()
            
        }
        
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
            
        
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarksList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
            
    }
}
