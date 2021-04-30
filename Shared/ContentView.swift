//
//  ContentView.swift
//  Shared
//
//  Created by Sam Russell on 3/30/21.
//

import SwiftUI
import AuthenticationServices



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

                Image("appleLogo")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(-18)
                    .padding(.top, 7)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    
            }
            .position(x: width/2, y: (height/2)+60)
            .frame(maxWidth: .infinity)
            



        }
            
    }
    }
    
    
    
    private func showAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
