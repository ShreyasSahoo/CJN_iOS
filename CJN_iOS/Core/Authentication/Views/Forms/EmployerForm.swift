//
//  EmployerForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct EmployerForm: View {
    @Binding var employerName: String
        @Binding var employerEmail: String
        @Binding var companyName: String
        @Binding var postName: String
        @Binding var employerPhone: String
        @Binding var employerSelectedPhoneCode: String
        @Binding var employerPassword: String
        @Binding var employerExperience: String
        let phoneCodes: [String]
    var body: some View {
       
        
            Form {
                TextFieldWithLabel(label: "Name", placeholder: "Name", text: $employerName)

                
                PhoneFieldWithLabel(label: "Phone", placeholder: "Phone", phone: $employerPhone, selectedPhoneCode: $employerSelectedPhoneCode, phoneCodes: phoneCodes)

              
                TextFieldWithLabel(label: "Email", placeholder: "Email", text: $employerEmail)
                
                SecureFieldWithLabel(label: "Password", placeholder: "Password", text: $employerPassword)

                TextFieldWithLabel(label: "Company Name", placeholder: "Company Name", text: $companyName)
             
                TextFieldWithLabel(label: "Post Name", placeholder: "Post Name", text: $postName)
                
                TextFieldWithLabel(label: "Experience", placeholder: "Experience", text: $employerExperience)
            }
            
            .scrollContentBackground(.hidden)
            .background(.white)


        
    }
}

//#Preview {
//    EmployerForm()
//}
