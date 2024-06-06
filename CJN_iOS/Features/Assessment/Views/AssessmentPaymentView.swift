//
//  AssessmentPaymentView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 29/05/24.
//

import SwiftUI

struct AssessmentPaymentView: View {
    @State var Card = ""
    @State var CVV = ""
    @State var ExpiryDate = ""
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    TextField("Card", text: $Card)
                        .padding()
                        .background(.secondary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 16))
                    TextField("Enter Card Number", text: $Card)
                        .padding()
                        .background(.secondary.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 16))
                    HStack{
                        TextField("CVV", text: $CVV)
                            .padding()
                            .background(.secondary.opacity(0.1))
                            .clipShape(.rect(cornerRadius: 16))
                        TextField("Expiry Date", text: $ExpiryDate)
                            .padding()
                            .background(.secondary.opacity(0.1))
                            .clipShape(.rect(cornerRadius: 16))
                    }
                    Button{
                        
                    } label: {
                        ButtonView(title: "Get OTP")
                    }
                }
                
            }
            .scrollContentBackground(.hidden)

            .navigationTitle("Pay for Assessment")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    AssessmentPaymentView()
}
