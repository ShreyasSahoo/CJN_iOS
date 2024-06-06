//
//  ViewerForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct ViewerForm: View {

   
    let phoneCodes: [String]
    @ObservedObject var registrationViewModel: RegistrationViewModel
    
    var body: some View {
        VStack {
            Form() {
                Section(header: Text("Viewer Information")) {
                    TextFieldWithLabel(label: "Name", placeholder: "Please enter the your name ", text: $registrationViewModel.viewerName)
                    TextFieldWithLabel(label: "Email", placeholder: "Please enter the viewer email *", text: $registrationViewModel.viewerEmail)
                    SecureFieldWithLabel(password: $registrationViewModel.viewerPass)
                    PhoneFieldWithLabel(label: "Phone Number", placeholder: "Phone Number", phone: $registrationViewModel.viewerPhone , selectedPhoneCode: $registrationViewModel.viewerCountryCode, phoneCodes: phoneCodes)
                }
                if !registrationViewModel.validationMessages.isEmpty {
                                    Section {
                                        ForEach(registrationViewModel.validationMessages, id: \.self) { message in
                                            Text(message)
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                
            }
            .frame(maxWidth: .infinity)
            .scrollContentBackground(.hidden)


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
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .frame(height: 44)
//                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .padding(.bottom)
    }
}

struct SecureFieldWithLabel: View {
    
    @Binding var password: String
    @State var isPasswordVisible = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .font(.headline)
           HStack{
               ZStack {
                   
                   TextField("Enter password",text: $password )
                       .textInputAutocapitalization(.never)
                       .padding()
                       .background(Color(UIColor.systemGray6))
                       .cornerRadius(8)
                       .frame(height: 44)
                       .opacity(isPasswordVisible ? 1 : 0)
                   
                   SecureField("Enter password", text: $password)
                       .textInputAutocapitalization(.never)
                       .padding()
                       .background(Color(UIColor.systemGray6))
                       .cornerRadius(8)
                       .frame(height: 44)
                       .opacity(isPasswordVisible ? 0 : 1)
                   
                   HStack {
                       Spacer()
                       Button(action: {
                           isPasswordVisible.toggle()
                       }) {
                           Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                               .foregroundColor(Color(UIColor.systemGray))
                               .padding()
                               .frame(maxHeight: 10)
                       }
                   }
               }
               .padding(.bottom, 10)
           }
//                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .padding(.bottom)
    }
}

struct PhoneFieldWithLabel: View {
    let label: String
    let placeholder: String
    @Binding var phone: String
    @Binding var selectedPhoneCode: String
    let phoneCodes: [String]
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(label)
                .font(.headline)
            HStack {
                Picker("Country Code", selection: $selectedPhoneCode) {
                    ForEach(phoneCodes, id: \.self) { code in
                        Text(code)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                             
                TextField(placeholder, text: $phone)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)

            }
        }
        .padding(.bottom,8)
    }
}
