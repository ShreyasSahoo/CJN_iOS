//
//  CandidateForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct CandidateForm: View {

    @ObservedObject var registrationViewModel: RegistrationViewModel
    var phoneCodes: [String]
    
    var body: some View {
        Form() {
            
            if !registrationViewModel.validationMessages.isEmpty {
                                Section {
                                    
                                    Text(registrationViewModel.validationMessages.first!)
                                            .foregroundColor(.red)
                                    
                                }
                            }
            
            TextFieldWithLabel(label: "Candidate Name", placeholder: "Candidate Name *", text: $registrationViewModel.candidateName)

            PhoneFieldWithLabel(label: "Candidate's Phone", placeholder: "Candidate's Phone", phone: $registrationViewModel.candidatePhone, selectedPhoneCode: $registrationViewModel.candidateCountryCode, phoneCodes: phoneCodes)


            TextFieldWithLabel(label: "Candidate Email", placeholder: "Candidate Email *", text: $registrationViewModel.candidateEmail)
            SecureFieldWithLabel(password: $registrationViewModel.candidatePass)

            HStack(alignment:.top) {
                Text("Candidate Gender")
                    .font(.headline)
                    
                Picker(selection: $registrationViewModel.candidateGender, label: Text("")) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)

            }
           

            TextFieldWithLabel(label: "Candidate Department", placeholder: "Candidate Department", text: $registrationViewModel.candidateDepartment)
            VStack(alignment:.leading){
                Text("Academic Year")
                    .font(.headline)
                TextField("Academic Year", value: $registrationViewModel.candidateAcademicYear, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(8)
                                .frame(height: 44)
            }
            
            
            HStack( spacing: 12) {
                Text("Candidate's Date Of Birth ")
                    .font(.headline)
                    
                DatePicker("", selection: $registrationViewModel.candidateDateOfBirth, displayedComponents: .date)
                    .foregroundStyle(Color.accentColor)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                    .cornerRadius(8)

            }
           

            TextFieldWithLabel(label: "College Code", placeholder: "College Code", text: $registrationViewModel.candidateCollegeCode)
           
            TextFieldWithLabel(label: "Highest Qualification", placeholder: "Highest Qualification", text: $registrationViewModel.candidateHighestQualification)
            TextFieldWithLabel(label: "Skills", placeholder: "Skills", text: $registrationViewModel.candidateSkills)
            TextFieldWithLabel(label: "Experience", placeholder: "Experience", text: $registrationViewModel.candidateExperience)
        }
        .frame(maxWidth: .infinity)
        .scrollContentBackground(.hidden)
        .background(.white)

    }
}





//#Preview {
//   CandidateForm()
//}
