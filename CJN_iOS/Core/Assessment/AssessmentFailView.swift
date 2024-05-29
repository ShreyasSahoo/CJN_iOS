//
//  AssessmentFailView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct AssessmentFailView: View {
    @State private var Score = Int()
    var body: some View {
        GeometryReader{ geo in
            NavigationStack{
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                    TextField("Enter Score", value: $Score, format: .number)
                        .padding()
                        .background(.secondary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 16))
                    Spacer()
                    VStack{
                        Image(systemName: "xmark.circle")
                            .scaleEffect(2)
                            .padding(.bottom)
                            .foregroundStyle(.red)
//                            .shadow(color: Color.black, radius: 2)
                       
                        Text("You have failed thesquare.and.arrow.up assessment")
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 2)
                        Text("Do you want training?")
                        Button{
                            
                        } label: {
                            ButtonView(title: "Yes")
                        }
                     

                    }
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke( Color.secondary)
                    }
                    Spacer()
                }
                .navigationTitle("Enter Score")
                .navigationBarTitleDisplayMode(.inline)
                .frame(width: geo.size.width*9/10)
            }

        }
    }
}

#Preview {
    AssessmentFailView()
}
