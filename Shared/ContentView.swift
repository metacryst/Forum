//
//  ContentView.swift
//  Shared
//
//  Created by Sam Russell on 3/30/21.
//
//
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ MAKE IT WORK FOR 100 DUDES


import UIKit
import SwiftUI
import AuthenticationServices



struct ContentView: View {
    
    @Environment(\.window) var window: UIWindow?
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    
    
    var body: some View {
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
    ZStack {
     Color.black
     .edgesIgnoringSafeArea(.all)
            
            
            
        ScrollView(.vertical) {
            Button(action: {
                showAppleLogin()
                }) {

                Image("appleLogo").renderingMode(.original)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(-20)
                    .padding(.top, 0)
                    .offset(x: 0, y:4)
//                    .clipShape(Circle())
                    .cornerRadius(13)
                
                    
                    
            }
            .position(x: width/2, y: (height/2)+60)
            .frame(maxWidth: .infinity)
            

        }
            
    }
        
    }
    
    
    
    
    private func showAppleLogin() {
        print("Apple Log In")
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        print(request)
        
        request.requestedScopes = [.fullName, .email]
        
        performSignIn(using: [request])
        
    }
    
    /// Prompts the user if an existing iCloud Keychain credential or Apple ID credential is found.
    private func performExistingAccountSetupFlows() {
      #if !targetEnvironment(simulator)
      // Note that this won't do anything in the simulator.  You need to
      // be on a real device or you'll just get a failure from the call.
      let requests = [
        ASAuthorizationAppleIDProvider().createRequest(),
        ASAuthorizationPasswordProvider().createRequest()
      ]

      performSignIn(using: requests)
      #endif
    }

    private func performSignIn(using requests: [ASAuthorizationRequest]) {
      appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
        if success {
            // update UI
            print("---Success: \(success)")
        
        } else {
            // show the user an error
        }
      }

      let controller = ASAuthorizationController(authorizationRequests: requests)
      controller.delegate = appleSignInDelegates
      controller.presentationContextProvider = appleSignInDelegates

      controller.performRequests()
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
