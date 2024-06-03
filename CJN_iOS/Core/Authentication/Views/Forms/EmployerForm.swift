//
//  EmployerForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct EmployerForm: View {
//    @Binding var employerName: String
//        @Binding var employerEmail: String
//        @Binding var companyName: String
//        @Binding var postName: String
//        @Binding var employerPhone: String
//        @Binding var employerSelectedPhoneCode: String
//        @Binding var employerPassword: String
//        @Binding var employerExperience: String
    @ObservedObject var registrationViewModel: RegistrationViewModel
        let phoneCodes: [String]
    var body: some View {
       
        
            Form {
                if !registrationViewModel.validationMessages.isEmpty {
                                    Section {
                                        
                                        Text(registrationViewModel.validationMessages.first!)
                                                .foregroundColor(.red)
                                        
                                    }
                                }
                
                TextFieldWithLabel(label: "Name", placeholder: "Name", text: $registrationViewModel.employerName)

                
                PhoneFieldWithLabel(label: "Phone", placeholder: "Phone", phone: $registrationViewModel.employerPhone, selectedPhoneCode: $registrationViewModel.employerCountryCode, phoneCodes: phoneCodes)

              
                TextFieldWithLabel(label: "Email", placeholder: "Email", text: $registrationViewModel.employerEmail)
                
                SecureFieldWithLabel(password: $registrationViewModel.employerPass)
                
                TextFieldWithLabel(label: "Company Name", placeholder: "Company Name", text: $registrationViewModel.employerCompanyName)
             
                TextFieldWithLabel(label: "Post Name", placeholder: "Post Name", text: $registrationViewModel.employerPostName)
                
//                TextFieldWithLabel(label: "Experience", placeholder: "Experience", text: $registrationViewModel.employerYearsOfExperience)
                VStack(alignment:.leading){
                    Text("Years of Experience")
                        .font(.headline)
                    TextField("Years of Experience", value: $registrationViewModel.employerYearsOfExperience, formatter: NumberFormatter())
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
                                    .frame(height: 44)
                }
                
            }
            .frame(maxWidth: .infinity)
            .scrollContentBackground(.hidden)
            .background(.white)


        
    }
}

//#Preview {
//    EmployerForm()
//}
