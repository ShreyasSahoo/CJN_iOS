//
//  SplashScreenView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 25/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("logo") // Replace "appLogo" with the name of your logo image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Spacer()
        }
    }
}
#Preview {
    SplashScreenView()
}
