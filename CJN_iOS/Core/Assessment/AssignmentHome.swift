//
//  AssignmentHome.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct AssignmentHome: View {
    var body: some View {
        GeometryReader{ geo in
            NavigationStack{
                VStack(spacing:20){
                    Image("assessmentLogo")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Button{
                        
                    }label:{
                        ButtonView(title: "Pay for Assignment")
                        
                    }
                    Button{
                        
                    }label:{
                        ButtonView(title: "Enter Score")
                        
                    }
                    Spacer()
                }
                .frame(width: geo.size.width*9/10)
                .navigationTitle("Assessment")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
        
    }
}

#Preview {
    AssignmentHome()
}
