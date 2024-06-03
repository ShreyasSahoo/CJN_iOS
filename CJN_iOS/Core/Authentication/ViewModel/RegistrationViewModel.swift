//
//  RegisterationViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 22/05/24.
//

import Foundation
//import SwiftUI

class RegistrationViewModel: ObservableObject {
    

    
    @Published var viewerResponse: ViewerResponse? = nil
    @Published var employerResponse: EmployerResponse? = nil
    @Published var candidateResponse: CandidateResponse? = nil
    
    @Published var viewerName = ""
    @Published var viewerEmail = ""
    @Published var viewerCountryCode  = ""
    @Published var viewerPhone  = ""
    @Published var viewerPass  = ""
        
    @Published var employerName  = ""
    @Published var employerEmail  = ""
    @Published var employerCompanyName  = ""
    @Published var employerPostName  = ""
    @Published var employerCountryCode  = ""
    @Published var employerPhone  = ""
    @Published var employerPass  = ""
    @Published var employerYearsOfExperience = Int()
    
    @Published var candidateName = ""
    @Published var candidateEmail = ""
    @Published var candidateCountryCode = ""
    @Published var candidatePhone = ""
    @Published var candidatePass = ""
    @Published var candidateGender = ""
    @Published var candidateAcademicYear = Int()
    @Published var candidateDateOfBirth = Date()
    @Published var candidateDepartment = ""
    @Published var candidateCollegeCode = ""
    @Published var candidateHighestQualification = ""
    @Published var candidateSkills = ""
    @Published var candidateExperience = ""
    
    
    
    private let candidateURL = URL(string: "https://dev.cjnnow.com/api/create_candidate_profile")!
    private let employerURL = URL(string: "https://dev.cjnnow.com/api/add_employer")!
    private let viewerURL = URL(string: "https://dev.cjnnow.com/api/add_viewer")!
    
    @Published var validationMessages: [String] = []
    
    func validateViewerForm() -> Bool {
        validationMessages.removeAll()
        
        if viewerName.isEmpty {
            validationMessages.append("Name is required.")
        }
        
        if viewerEmail.isEmpty || !isValidEmail(viewerEmail) {
            validationMessages.append("Enter a valid Email.")
        }

        if viewerPass.count < 6 {
            validationMessages.append("Password should atleast have 6 characters")
        }
        if viewerPhone.count != 10 {
            validationMessages.append("Enter a Valid Phone Number")
        }
        
        return validationMessages.isEmpty
    }
    
    func validateEmployerForm() -> Bool {
        
        validationMessages.removeAll()
        
        if employerName.isEmpty {
            validationMessages.append("Name is required.")
        }
        
        if employerCompanyName.isEmpty {
            validationMessages.append("Company Name is required.")
        }
        if employerPostName.isEmpty {
            validationMessages.append("Post Name is required.")
        }
        
        if employerEmail.isEmpty || !isValidEmail(employerEmail) {
            validationMessages.append("Enter a valid Email.")
        }
        

        if employerPass.count < 6 {
            validationMessages.append("Password should atleast have 6 characters")
        }
        if employerPhone.count != 10 {
            validationMessages.append("Enter a Valid Phone Number")
        }
        
        
        return validationMessages.isEmpty
    }
    
    func validateCandidateForm() -> Bool {
        
        validationMessages.removeAll()
        
        if candidateName.isEmpty {
            validationMessages.append("Name is required.")
        }
        
        if candidateDepartment.isEmpty {
            validationMessages.append("Candidate Department is required.")
        }
        if candidateCollegeCode.isEmpty {
            validationMessages.append("College Code is required.")
        }
        
        if candidateHighestQualification.isEmpty {
            validationMessages.append("Highest Qualification is required.")
        }
        
        if candidateSkills.isEmpty {
            validationMessages.append("Skills are required.")
        }
        
        if candidateEmail.isEmpty || !isValidEmail(employerEmail) {
            validationMessages.append("Enter a valid Email.")
        }
        
        if candidatePass.count < 6 {
            validationMessages.append("Password should atleast have 6 characters")
        }
        if employerPhone.count != 10 {
            validationMessages.append("Enter a Valid Phone Number")
        }
        
        
        return validationMessages.isEmpty
    }

    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    
    
    
    func registerUser(_ selectedUserType : String) async {
        if selectedUserType == "Viewer"{
            if validateViewerForm() {
                await registerViewer()
            if viewerResponse?.responseStatus == false {
                print("dslakfj")
            }
                                    }
           
            
        }
        else if selectedUserType == "Employer" {
            if validateEmployerForm() {
                await registerEmployer()
            }
            
        }
        else if selectedUserType == "Candidate" {
            if validateCandidateForm() {
                await registerCandidate()
            }
            
            
        }
        
    }
    
    func registerViewer() async  {
        
        let payload: [String: AnyHashable] = ["viewer_name": viewerName, "country_code": viewerCountryCode, "viewer_phone": viewerPhone, "viewer_email": viewerEmail, "viewer_pass": viewerPass]

        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed) else {
            print("Failed to serialize JSON")
            return
        }


        var request = URLRequest(url: viewerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("987654321", forHTTPHeaderField: "apikey")
        request.httpBody = jsonData
//
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("\(responseObject)")
            
            let decodedResponse = try JSONDecoder().decode(ViewerResponse.self, from: data)
                    switch decodedResponse.responseMessage {
                    case .data(let data):
                        print("Success! Data received:")
                        viewerResponse = decodedResponse
                        print(data)
                    case .errors(let errors):
                        print("Error! Issues found:")
                        if let emailErrors = errors.viewerEmail {
                            print("Email Errors: \(emailErrors.joined(separator: ", "))")
                        }
                        if let passErrors = errors.viewerPass {
                            print("Password Errors: \(passErrors.joined(separator: ", "))")
                        }
                    }
        } catch {
            print(error)
        }
    }
    
    func registerEmployer() async {
        
        let payload: [String: AnyHashable] = [
            "employer_name": employerName,
            "employer_comp_name": employerCompanyName,
            "employer_post_name": employerPostName,
            "country_code": employerCountryCode,
            "employer_phone": employerPhone,
            "employer_email": employerEmail,
            "employer_pass": employerPass,
            "employer_year_of_experience": employerYearsOfExperience
        ]
        
        // Serialize the JSON payload
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed) else {
            print("Failed to serialize JSON")
            return
        }
        
        // Print the serialized JSON data
        print("Serialized JSON Data: \(String(describing: String(data: jsonData, encoding: .utf8)))")
        
      
        
        // Create and configure the URL request
        var request = URLRequest(url: employerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("987654321" , forHTTPHeaderField: "apikey")
        request.httpBody = jsonData
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("\(responseObject)")

            
            let decodedResponse = try JSONDecoder().decode(EmployerResponse.self, from: data)
//                    switch decodedResponse.responseMessage {
//                    case .data(let data):
//                        print("Success! Data received:")
//                        print(data)
//                        employerResponse = decodedResponse
//                        
//                    case .errors(let errors):
//                        print("Error! Issues found:")
//                        if let emailErrors = errors.employerEmail {
//                            print("Email Errors: \(emailErrors.joined(separator: ", "))")
//                        }
//                        if let passErrors = errors.employerPass {
//                            print("Password Errors: \(passErrors.joined(separator: ", "))")
//                        }
//                        print(errors)
//                    }
            print(decodedResponse)
           
        } catch {
            print(error)
        }
    }
        
    
    func registerCandidate() async {
            
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" //2023-05-30
        let dateString = formatter.string(from: candidateDateOfBirth)
        
        let payload: [String: AnyHashable] = [
            "candidate_name": candidateName,
            "candidate_email": candidateEmail,
            "country_code": candidateCountryCode,
            "candidate_phone": candidatePhone,
            "candidate_pass": candidatePass,
            "candidate_gender": candidateGender,
            "candidate_acd_year": candidateAcademicYear,
            "candidate_dob": dateString,
            "candidate_dept": candidateDepartment,
            "candidate_clg_code": candidateCollegeCode,
            "highest_qualification": candidateHighestQualification,
            "skills": candidateSkills,
            "experience": candidateExperience
        ]
        
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed) else {
            print("Failed to serialize JSON")
            return
        }
        
        
      
       
        var request = URLRequest(url: candidateURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("987654321" , forHTTPHeaderField: "apikey")
        request.httpBody = jsonData
        

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("\(responseObject)")
            
            let decodedResponse = try JSONDecoder().decode(CandidateResponse.self, from: data)
                    switch decodedResponse.responseMessage {
                    case .data(let data):
                        print("Success! Data received:")
                        print(data)
                    case .errors(let errors):
                        print("Error! Issues found:")
                        if let emailErrors = errors.candidateEmail {
                            print("Email Errors: \(emailErrors.joined(separator: ", "))")
                        }
                        if let passErrors = errors.candidatePass {
                            print("Password Errors: \(passErrors.joined(separator: ", "))")
                        }
                    }
           
        } catch {
            print(error)
        }

        
    }

}


