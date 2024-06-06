//
//  AssessmentPassView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct AssessmentPassView: View {
    @State private var Score = 0
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
                        Image(systemName: "checkmark.circle.fill")
                            .scaleEffect(2)
                            .padding(.bottom)
                            .foregroundStyle(.green)
                            .shadow(color: Color.black, radius: 2)
                        Text("Congratulations!")
                        Text("You have passed your assessment")
                    }
                    .padding()
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke( Color.secondary)
                    }
                    Spacer()
                    Button{
                        
                    } label: {
                        ButtonView(title: "Submit")
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
    AssessmentPassView()
}
