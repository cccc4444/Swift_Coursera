//
//  CircleImage.swift
//  T1_Creating and Combining Views
//
//  Created by Danylo Kushlianskyi on 31.05.2022.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
                        .scaledToFit()
            .frame(width: 300, height: 300)
            

        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
