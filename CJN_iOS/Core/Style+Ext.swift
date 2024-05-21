//
//  Style+Ext.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI
extension TextField {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

extension Picker {
    func pickerStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

extension VStack {
    func formStyle() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4)
    }
}
