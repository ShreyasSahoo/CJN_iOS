//
//  RegistrationView.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var selectedUserType = "Candidate"
    @State private var candidateName = ""
    @State private var candidatePhone = ""
    @State private var candidateEmail = ""
    @State private var candidateGender = "Female"
    @State private var candidateDepartment = ""
    @State private var academicYear = ""
    @State private var candidateDOB = Date()
    @State private var collegeCode = ""
    @State private var password = ""
    @State private var highestQualifications = ""
    @State private var skills = ""
    @State private var experience = ""

    @State private var employerName = ""
    @State private var employerEmail = ""
    @State private var companyName = ""
    @State private var postName = ""
    @State private var employerPhone: String = ""
    @State private var employerSelectedPhoneCode: String = ""
    @State private var employerPassword = ""
    @State private var employerExperience = ""
    
    @State private var viewerName = ""
    @State private var viewerEmail = ""
    @State private var viewerPassword = ""
    @State private var viewerPhone: String = ""
    @State private var selectedPhoneCode: String = ""

    let phoneCodes = [
        "Afghanistan (+93)",
        "Albania (+355)",
        "Algeria (+213)",
        "Andorra (+376)",
        "Angola (+244)",
        "Anguilla (+1-264)",
        "Antigua & Barbuda (+1-268)",
        "Argentina (+54)",
        "Armenia (+374)",
        "Australia (+61)",
        "Austria (+43)",
        "Azerbaijan (+994)",
        "Bahamas (+1-242)",
        "Bahrain (+973)",
        "Bangladesh (+880)",
        "Barbados (+1-246)",
        "Belarus (+375)",
        "Belgium (+32)",
        "Belize (+501)",
        "Benin (+229)",
        "Bermuda (+1-441)",
        "Bhutan (+975)",
        "Bolivia (+591)",
        "Bosnia & Herzegovina (+387)",
        "Botswana (+267)",
        "Brazil (+55)",
        "Brunei Darussalam (+673)",
        "Bulgaria (+359)",
        "Burkina Faso (+226)",
        "Burundi (+257)",
        "Cambodia (+855)",
        "Cameroon (+237)",
        "Canada (+1)",
        "Cape Verde (+238)",
        "Cayman Islands (+1-345)",
        "Central African Republic (+236)",
        "Chad (+235)",
        "Chile (+56)",
        "China (+86)",
        "Colombia (+57)",
        "Comoros (+269)",
        "Congo (+242)",
        "Cook Islands (+682)",
        "Costa Rica (+506)",
        "Croatia (+385)",
        "Cuba (+53)",
        "Cyprus (+357)",
        "Czech Republic (+420)",
        "Denmark (+45)",
        "Djibouti (+253)",
        "Dominica (+1-767)",
        "Dominican Republic (+1-809, +1-829, +1-849)",
        "Ecuador (+593)",
        "Egypt (+20)",
        "El Salvador (+503)",
        "Equatorial Guinea (+240)",
        "Eritrea (+291)",
        "Estonia (+372)",
        "Ethiopia (+251)",
        "Fiji (+679)",
        "Finland (+358)",
        "France (+33)",
        "French Guiana (+594)",
        "Gabon (+241)",
        "Gambia (+220)",
        "Georgia (+995)",
        "Germany (+49)",
        "Ghana (+233)",
        "Gibraltar (+350)",
        "Greece (+30)",
        "Greenland (+299)",
        "Grenada (+1-473)",
        "Guadeloupe (+590)",
        "Guam (+1-671)",
        "Guatemala (+502)",
        "Guinea (+224)",
        "Guinea-Bissau (+245)",
        "Guyana (+592)",
        "Haiti (+509)",
        "Honduras (+504)",
        "Hong Kong (+852)",
        "Hungary (+36)",
        "Iceland (+354)",
        "India (+91)",
        "Indonesia (+62)",
        "Iran (+98)",
        "Iraq (+964)",
        "Ireland (+353)",
        "Israel (+972)",
        "Italy (+39)",
        "Jamaica (+1-876)",
        "Japan (+81)",
        "Jordan (+962)",
        "Kazakhstan (+7)",
        "Kenya (+254)",
        "Kiribati (+686)",
        "Kuwait (+965)",
        "Kyrgyzstan (+996)",
        "Laos (+856)",
        "Latvia (+371)",
        "Lebanon (+961)",
        "Lesotho (+266)",
        "Liberia (+231)",
        "Libya (+218)",
        "Liechtenstein (+423)",
        "Lithuania (+370)",
        "Luxembourg (+352)",
        "Macao (+853)",
        "Macedonia (+389)",
        "Madagascar (+261)",
        "Malawi (+265)",
        "Malaysia (+60)",
        "Maldives (+960)",
        "Mali (+223)",
        "Malta (+356)",
        "Marshall Islands (+692)",
        "Martinique (+596)",
        "Mauritania (+222)",
        "Mauritius (+230)",
        "Mexico (+52)",
        "Micronesia (+691)",
        "Moldova (+373)",
        "Monaco (+377)",
        "Mongolia (+976)",
        "Montenegro (+382)",
        "Montserrat (+1-664)",
        "Morocco (+212)",
        "Mozambique (+258)",
        "Myanmar (+95)",
        "Namibia (+264)",
        "Nauru (+674)",
        "Nepal (+977)",
        "Netherlands (+31)",
        "New Caledonia (+687)",
        "New Zealand (+64)",
        "Nicaragua (+505)",
        "Niger (+227)",
        "Nigeria (+234)",
        "Niue (+683)",
        "North Korea (+850)",
        "Norway (+47)",
        "Oman (+968)",
        "Pakistan (+92)",
        "Palau (+680)",
        "Palestine (+970)",
        "Panama (+507)",
        "Papua New Guinea (+675)",
        "Paraguay (+595)",
        "Peru (+51)",
        "Philippines (+63)",
        "Poland (+48)",
        "Portugal (+351)",
        "Puerto Rico (+1-787, +1-939)",
        "Qatar (+974)",
        "Republic of the Congo (+242)",
        "Reunion Island (+262)",
        "Romania (+40)",
        "Russia (+7)",
        "Rwanda (+250)",
        "Saint Kitts and Nevis (+1-869)"
        ]

    var body: some View {
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
                        candidateForm
                    } else if selectedUserType == "Employer" {
                        employerForm
                    } else if selectedUserType == "Viewer" {
                        viewerForm
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

    private var candidateForm: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Candidate Name
            TextField("Candidate Name *", text: $candidateName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Candidate Phone
            TextField("Candidate Phone *", text: $candidatePhone)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Candidate Email
            TextField("Candidate Email *", text: $candidateEmail)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Candidate Gender
            Picker(selection: $candidateGender, label: Text("Candidate Gender")) {
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

            // Candidate Department
            TextField("Candidate Department", text: $candidateDepartment)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Academic Year
            TextField("Academic Year", text: $academicYear)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Candidate DOB
            DatePicker("Candidate Date Of Birth (DOB)", selection: $candidateDOB, displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // College Code
            TextField("College Code", text: $collegeCode)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Password
            SecureField("Password *", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Highest Qualifications
            TextField("Highest Qualification", text: $highestQualifications)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Skills
            TextField("Skills", text: $skills)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)

            // Experience
            TextField("Experience", text: $experience)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .padding()
        .cornerRadius(8)
        .shadow(color: Color.blue.opacity(0.4), radius: 8, x: 0, y: 4)

    }

    private var employerForm: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Employer Name
            TextField("Employer Name", text: $employerName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Phone Number
            HStack {
                Picker("Phone Code", selection: $employerSelectedPhoneCode) {
                    ForEach(phoneCodes, id: \.self) { code in
                        Text(code)
                            .minimumScaleFactor(0.1)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 100)
                
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

                TextField("Phone Number", text: $employerPhone)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            }

            // Employer Email
            TextField("Email", text: $employerEmail)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Employer Password
            SecureField("Password", text: $employerPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Company Name
            TextField("Company Name", text: $companyName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Post Name
            TextField("Post Name", text: $postName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Experience
            TextField("Experience", text: $employerExperience)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .padding()
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4)


    }

    private var viewerForm: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Viewer Name
            TextField("Please enter the viewer username *", text: $viewerName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Phone Number
            HStack {
                Picker("Phone Code", selection: $selectedPhoneCode) {
                    ForEach(phoneCodes, id: \.self) { code in
                        Text(code)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                TextField("Phone Number", text: $viewerPhone)
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

            // Viewer Email
            TextField("Please enter the viewer email *", text: $viewerEmail)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)

            // Viewer Password
            SecureField("Please enter the viewer password *", text: $viewerPassword)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }
        .padding()
        .cornerRadius(8)
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
        employerPassword = ""
        employerExperience = ""

        viewerName = ""
        viewerPhone = ""
        viewerEmail = ""
        viewerPassword = ""
    }

    private func registerUser() {
        // Registration logic here
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
