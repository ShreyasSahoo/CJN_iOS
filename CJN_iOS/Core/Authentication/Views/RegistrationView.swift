//
//  RegistrationView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    @State  var selectedUserType = "Candidate"
    @State  var candidateName = ""
    @State  var candidatePhone = ""
    @State  var candidateEmail = ""
    @State  var candidateGender = "Female"
    @State  var candidateDepartment = ""
    @State  var academicYear = ""
    @State  var candidateDOB = Date()
    @State  var collegeCode = ""
    @State  var password = ""
    @State  var highestQualifications = ""
    @State  var skills = ""
    @State  var experience = ""
    @State  var candidateSelectedPhoneCode: String = ""
    
    @State  var employerName = ""
    @State  var employerEmail = ""
    @State  var companyName = ""
    @State  var postName = ""
    @State  var employerPhone: String = ""
    @State  var employerSelectedPhoneCode: String = ""
    @State  var employerPassword = ""
    @State  var employerExperience = ""
    
//    @State  var viewerName = ""
//    @State  var viewerEmail = ""
//    @State  var viewerPassword = ""
//    @State  var viewerPhone: String = ""
//    @State  var selectedPhoneCode: String = ""

    
    let phoneCodes = [
        "+1", "+7", "+20", "+27", "+30", "+31", "+32", "+33", "+34", "+36", "+39", "+40", "+41", "+43", "+44",
        "+45", "+46", "+47", "+48", "+49", "+51", "+52", "+53", "+54", "+55", "+56", "+57", "+58", "+60", "+61",
        "+62", "+63", "+64", "+65", "+66", "+81", "+82", "+84", "+86", "+90", "+91", "+92", "+93", "+94", "+95",
        "+98", "+211", "+212", "+213", "+216", "+218", "+220", "+221", "+222", "+223", "+224", "+225", "+226",
        "+227", "+228", "+229", "+230", "+231", "+232", "+233", "+234", "+235", "+236", "+237", "+238", "+239",
        "+240", "+241", "+242", "+243", "+244", "+245", "+246", "+247", "+248", "+249", "+250", "+251", "+252",
        "+253", "+254", "+255", "+256", "+257", "+258", "+260", "+261", "+262", "+263", "+264", "+265", "+266",
        "+267", "+268", "+269", "+290", "+291", "+297", "+298", "+299", "+350", "+351", "+352", "+353", "+354",
        "+355", "+356", "+357", "+358", "+359", "+370", "+371", "+372", "+373", "+374", "+375", "+376", "+377",
        "+378", "+379", "+380", "+381", "+382", "+383", "+385", "+386", "+387", "+389", "+420", "+421", "+423",
        "+500", "+501", "+502", "+503", "+504", "+505", "+506", "+507", "+508", "+509", "+590", "+591", "+592",
        "+593", "+594", "+595", "+596", "+597", "+598", "+599", "+670", "+672", "+673", "+674", "+675", "+676",
        "+677", "+678", "+679", "+680", "+681", "+682", "+683", "+685", "+686", "+687", "+688", "+689", "+690",
        "+691", "+692", "+850", "+852", "+853", "+855", "+856", "+880", "+886", "+960", "+961", "+962", "+963",
        "+964", "+965", "+966", "+967", "+968", "+970", "+971", "+972", "+973", "+974", "+975", "+976", "+977",
        "+992", "+993", "+994", "+995", "+996", "+998"
    ]


    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Signup")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Picker(selection: $selectedUserType, label: Text("User Type")) {
                            Text("Candidate").tag("Candidate")
                            Text("Employer").tag("Employer")
                            Text("Viewer").tag("Viewer")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        
                        if selectedUserType == "Candidate" {
                            
                            CandidateForm(candidateName: $candidateName, candidatePhone: $candidatePhone, candidateEmail: $candidateEmail, candidateGender: $candidateGender, candidateDepartment: $candidateDepartment, academicYear: $academicYear, candidateDOB: $candidateDOB, collegeCode: $collegeCode, password: $password, highestQualifications: $highestQualifications, skills: $skills, experience: $experience, candidateSelectedPhoneCode: $candidateSelectedPhoneCode,
                                          phoneCodes:phoneCodes)
                            .frame(minHeight:geo.size.height*0.7)
                            
                        } else if selectedUserType == "Employer" {
                            EmployerForm(employerName: $employerName, employerEmail: $employerEmail, companyName: $companyName, postName: $postName, employerPhone: $employerPhone, employerSelectedPhoneCode: $employerSelectedPhoneCode, employerPassword: $employerPassword, employerExperience: $employerExperience, phoneCodes: phoneCodes)
                                .frame(minHeight:geo.size.height*0.7)
                        } else if selectedUserType == "Viewer" {
                            ViewerForm(phoneCodes: phoneCodes, registrationViewModel: registrationViewModel)
                                .frame(minHeight:geo.size.height*0.7)
                            
                            
                        }
                        
                        HStack {
                            Button {
                                clearForm()
                            } label : {
                                Text("Clear")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                
                                registerUser()
                            }) {
                                Text("Register")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Register", displayMode: .inline)
            }
        }
    }

 

    private func clearForm() {
        candidateName = ""
        candidatePhone = ""
        candidateEmail = ""
        candidateGender = "Female"
        candidateDepartment = ""
        academicYear = ""
        candidateDOB = Date()
        collegeCode = ""
        password = ""
        highestQualifications = ""
        skills = ""
        experience = ""

        employerName = ""
        employerEmail = ""
        companyName = ""
        postName = ""
        employerPhone = ""
        employerSelectedPhoneCode = ""
        employerPassword = ""
        employerExperience = ""

//        viewerName = ""
//        viewerPhone = ""
//        viewerEmail = ""
//        viewerPassword = ""
//        selectedPhoneCode = ""
    }


    private func registerUser() {
        if selectedUserType == "Viewer"{
            registrationViewModel.registerViewer()
        }
        else if selectedUserType == "Employer" {
            registrationViewModel.registerEmployer(name: employerName, email: employerEmail, companyName: companyName, postName: postName, countryCode: employerSelectedPhoneCode, phone: employerPhone, employerPass: employerPassword, yearsOfExperience: Int(employerExperience) ?? 0)
        }
        else if selectedUserType == "Candidate" {
            registrationViewModel.registerCandidate(
                name: candidateName,
                email: candidateEmail,
                countryCode: candidateSelectedPhoneCode,
                phone: candidatePhone,
                candidatePass: password,
                gender: candidateGender,
                academicYear: academicYear,
                dateOfBirth: DateFormatter.localizedString(from: candidateDOB, dateStyle: .short, timeStyle: .none),
                department: candidateDepartment,
                collegeCode: collegeCode,
                highestQualification: highestQualifications,
                skills: skills,
                experience: experience
            )
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
