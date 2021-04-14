//
//  ContentView.swift
//  Shared
//
//  Created by Sam Russell on 3/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
        
    ZStack {
     Color.black
     .edgesIgnoringSafeArea(.all)
            
            
            
        ScrollView(.vertical) {
            Button(action: {
                print("Round Action")
                }) {
                Text("")
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            .position(x: width/2, y: height/2)
            .frame(maxWidth: .infinity)
        }
            
            
            
            
            
            
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
