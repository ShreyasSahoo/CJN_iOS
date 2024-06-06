//
//  RegistrationView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct iPadRegistrationView: View {
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    @Environment(\.presentationMode) private var presentationMode :Binding<PresentationMode>
    
    @State  var selectedUserType = "Candidate"
//    @State  var candidateName = ""
//    @State  var candidatePhone = ""
//    @State  var candidateEmail = ""
//    @State  var candidateGender = "Female"
//    @State  var candidateDepartment = ""
//    @State  var academicYear = ""
//    @State  var candidateDOB = Date()
//    @State  var collegeCode = ""
//    @State  var password = ""
//    @State  var highestQualifications = ""
//    @State  var skills = ""
//    @State  var experience = ""
//    @State  var candidateSelectedPhoneCode: String = ""
    
//    @State  var employerName = ""
//    @State  var employerEmail = ""
//    @State  var companyName = ""
//    @State  var postName = ""
//    @State  var employerPhone: String = ""
//    @State  var employerSelectedPhoneCode: String = ""
//    @State  var employerPassword = ""
//    @State  var employerExperience = ""
//    
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
            NavigationStack {
                ScrollView (showsIndicators:false){
                    VStack(alignment: .center, spacing: 16) {
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .padding(.top,40)
                     
                        
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
                            
                            CandidateForm(registrationViewModel: registrationViewModel, phoneCodes:phoneCodes)
                            .frame(width: geo.size.width*4/5)
                            .frame(minHeight:geo.size.height*0.7)
                            
                        } else if selectedUserType == "Employer" {
                            EmployerForm(registrationViewModel: RegistrationViewModel(), phoneCodes: phoneCodes)
                                .frame(width: geo.size.width*4/5)
                                .frame(minHeight:geo.size.height*0.7)
                        } else if selectedUserType == "Viewer" {
                            ViewerForm(phoneCodes: phoneCodes, registrationViewModel: registrationViewModel)
                                .frame(width: geo.size.width*4/5)
                                .frame(minHeight:geo.size.height*0.7)
                            
                            
                        }
                        
                        HStack (spacing:40){
                            Button (role: .destructive){
                                clearForm()
                            } label : {
                                Text("Clear")
                                    .frame(maxWidth: geo.size.width/4)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                Task{
                                    await     registrationViewModel.registerUser(selectedUserType)
                                }
                            
                                
                              
                            }) {
                                Text("Register")
                                    .frame(maxWidth: geo.size.width/4)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom)
                        
                    }
                    .frame(height: geo.size.height)
                    .padding()
                }
                .frame(width:geo.size.width, height: geo.size.height)
                .navigationBarTitle("Register", displayMode: .inline)
                .toolbar(content: {
                    ToolbarItem(placement:.topBarLeading){
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        } label:{
                            Image(systemName: "arrowshape.backward.circle.fill")
                                .foregroundStyle(Color.accentColor)
                                .scaleEffect(1.5)
                        }
                    }
                })
            }
        }
    }

 

    private func clearForm() {


    }


}

#Preview {
    NavigationStack{
        iPadRegistrationView()
    }
    
}
