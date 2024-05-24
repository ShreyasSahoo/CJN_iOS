//
//  ViewerForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct ViewerForm: View {
//    @Binding var viewerName: String
//    @Binding var viewerEmail: String
//    @Binding var viewerPassword: String
//    @Binding var viewerPhone: String
//    @Binding var selectedPhoneCode: String
   
    let phoneCodes: [String]
    @ObservedObject var registrationViewModel: RegistrationViewModel
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Viewer Information")) { // Add a header for the section
                    TextFieldWithLabel(label: "Name", placeholder: "Please enter the your name ", text: $registrationViewModel.viewerName)
                    TextFieldWithLabel(label: "Email", placeholder: "Please enter the viewer email *", text: $registrationViewModel.viewerEmail)
                    SecureFieldWithLabel(label: "Password", placeholder: "Please enter the viewer password *", text: $registrationViewModel.viewerPass)
                    PhoneFieldWithLabel(label: "Phone Number", placeholder: "Phone Number", phone: $registrationViewModel.viewerPhone , selectedPhoneCode: $registrationViewModel.viewerCountryCode, phoneCodes: phoneCodes)
                }
            }
            .formStyle(.grouped)
        }
    }
}

struct TextFieldWithLabel: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
    }
}

struct SecureFieldWithLabel: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            SecureField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
    }
}

struct PhoneFieldWithLabel: View {
    let label: String
    let placeholder: String
    @Binding var phone: String
    @Binding var selectedPhoneCode: String
    let phoneCodes: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            VStack {
                Picker("Phone Code", selection: $selectedPhoneCode) {
                    ForEach(phoneCodes, id: \.self) { code in
                        Text(code)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                TextField(placeholder, text: $phone)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            }
        }
    }
}
