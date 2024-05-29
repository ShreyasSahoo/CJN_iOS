//
//  CandidateForm.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 23/05/24.
//

import SwiftUI

struct CandidateForm: View {
    @Binding var candidateName: String
    @Binding var candidatePhone: String
    @Binding var candidateEmail: String
    @Binding var candidateGender: String
    @Binding var candidateDepartment: String
    @Binding var academicYear: String
    @Binding var candidateDOB: Date
    @Binding var collegeCode: String
    @Binding var password: String
    @Binding var highestQualifications: String
    @Binding var skills: String
    @Binding var experience: String
    @Binding var candidateSelectedPhoneCode: String
    var phoneCodes: [String]
    
    var body: some View {
        Form() {
            
            
            
            TextFieldWithLabel(label: "Candidate Name", placeholder: "Candidate Name *", text: $candidateName)
            
//            VStack(alignment: .leading, spacing: 4) {
//                Text("Candidate Phone")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                HStack {
//                    Picker("Phone Code", selection: $candidateSelectedPhoneCode) {
//                        ForEach(phoneCodes, id: \.self) { code in
//                            Text(code)
//                                .minimumScaleFactor(0.1)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .frame(width: 100)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
//                    )
//                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
//                    
//                    TextField("Phone Number", text: $candidatePhone)
//                        .keyboardType(.phonePad)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(8)
//                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
//                }
                PhoneFieldWithLabel(label: "Candidate's Phone", placeholder: "Candidate's Phone", phone: $candidatePhone, selectedPhoneCode: $candidateSelectedPhoneCode, phoneCodes: phoneCodes)
//            }

            TextFieldWithLabel(label: "Candidate Email", placeholder: "Candidate Email *", text: $candidateEmail)
            SecureFieldWithLabel(label: "Password", placeholder: "Please enter the candidate password *", text: $password)

            HStack(alignment:.top) {
                Text("Candidate Gender")
                    .font(.headline)
                    
                Picker(selection: $candidateGender, label: Text("")) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
            }
            .padding(.bottom)

            TextFieldWithLabel(label: "Candidate Department", placeholder: "Candidate Department", text: $candidateDepartment)
            TextFieldWithLabel(label: "Academic Year", placeholder: "Academic Year", text: $academicYear)
            
            HStack( spacing: 4) {
                Text("Candidate Date Of Birth (DOB)")
                    .font(.headline)
                DatePicker("", selection: $candidateDOB, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
            }
            .padding(.bottom)

            TextFieldWithLabel(label: "College Code", placeholder: "College Code", text: $collegeCode)
            TextFieldWithLabel(label: "Password", placeholder: "Password *", text: $password)
            TextFieldWithLabel(label: "Highest Qualification", placeholder: "Highest Qualification", text: $highestQualifications)
            TextFieldWithLabel(label: "Skills", placeholder: "Skills", text: $skills)
            TextFieldWithLabel(label: "Experience", placeholder: "Experience", text: $experience)
        }
        .scrollContentBackground(.hidden)
        .background(.white)

    }
}





//#Preview {
//   CandidateForm()
//}
