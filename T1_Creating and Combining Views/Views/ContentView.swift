

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarksList()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
        }
    }
}
