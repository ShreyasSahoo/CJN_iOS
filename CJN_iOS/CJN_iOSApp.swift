
//
//  CJN_iOSApp.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

@main
struct CJN_iOSApp: App {
 
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
        
    }
}

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                       
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                if UIDevice.current.userInterfaceIdiom == .pad {
                                iPadLoginView()
                            } else {
                                LoginView()
                            }
               
            }
        }
        
    }
}

