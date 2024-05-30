//
//  RegisterationViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 22/05/24.
//

import Foundation

//struct RegistrationResponse : Decodable {
//    
//    let responseMessage : ResponseMessage
//    let responseStatus : Bool
//    
//
//}   
//struct ResponseMessage : Decodable {
//    
//    let viewerEmail : String
//    let viewerName : String
//    let viewerPass : String
//    let viewerPhone : Int
//}


struct CandidateResponse: Codable {
    let responseMessage: ResponseMessage
    let responseStatus: Int
    
    enum CodingKeys: String, CodingKey {
        case responseMessage
        case responseStatus
    }
}

struct ResponseMessage: Codable {
    let data: CandidateData
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct CandidateData: Codable {
    let candidateAcdYear: Int
    let candidateClgCode: String
    let candidateDept: String
    let candidateDob: String
    let candidateEmail: String
    let candidateGender: String
    let candidateId: String
    let candidateImagePath: String
    let candidateName: String
    let candidatePass: String
    let candidatePhone: Int
    let candidatePicture: String
    let candidateResume: String
    let candidateVidume: String
    let countryCode: String
    let createdAt: String
    let experience: Int
    let highestQualification: String
    let id: Int
    let isActive: Bool
    let skills: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case candidateAcdYear = "candidate_acd_year"
        case candidateClgCode = "candidate_clg_code"
        case candidateDept = "candidate_dept"
        case candidateDob = "candidate_dob"
        case candidateEmail = "candidate_email"
        case candidateGender = "candidate_gender"
        case candidateId = "candidate_id"
        case candidateImagePath = "candidate_image_path"
        case candidateName = "candidate_name"
        case candidatePass = "candidate_pass"
        case candidatePhone = "candidate_phone"
        case candidatePicture = "candidate_picture"
        case candidateResume = "candidate_resume"
        case candidateVidume = "candidate_vidume"
        case countryCode = "country_code"
        case createdAt = "created_at"
        case experience = "experience"
        case highestQualification = "highest_qualification"
        case id
        case isActive = "is_active"
        case skills
        case updatedAt = "updated_at"
    }
}
class RegistrationViewModel: ObservableObject {
    
//    @Published var candidateRegistrationResponse = RegistrationResponse(responseMessage: ResponseMessage(viewerEmail: "", viewerName: "", viewerPass: "", viewerPhone: 0), responseStatus: false)
    
    @Published var candidateRegistrationResponse = CandidateResponse(responseMessage: ResponseMessage(data: CandidateData(candidateAcdYear: 0, candidateClgCode: "", candidateDept: "", candidateDob: "", candidateEmail: "", candidateGender: "", candidateId: "", candidateImagePath: "", candidateName: "", candidatePass: "", candidatePhone: 0, candidatePicture: "", candidateResume: "", candidateVidume: "", countryCode: "", createdAt: "", experience: 0, highestQualification: "", id: 0, isActive: false, skills: "", updatedAt: "")), responseStatus: 0)
    
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
    @Published var candidateAcademicYear = 0
    @Published var candidateDateOfBirth = Date()
    @Published var candidateDepartment = ""
    @Published var candidateCollegeCode = ""
    @Published var candidateHighestQualification = ""
    @Published var candidateSkills = ""
    @Published var candidateExperience = ""
    
    private let candidateURL = URL(string: "https://dev.cjnnow.com/api/create_candidate_profile")!
    private let employerURL = URL(string: "https://dev.cjnnow.com/api/add_employer")!
    private let viewerURL = URL(string: "https://dev.cjnnow.com/api/add_viewer")!
    
   
    
    func registerViewer()  {
        
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
//        do {
//            let (data, _) = try await URLSession.shared.data(for: request)
//            
//                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("\(responseObject)")
//           
//        } catch {
//            print(error)
//        }
//        
        
//         Execute the URL request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            // Check for errors in the response
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Ensure data is received
            guard let data = data else {
                print("No data received")
                return
            }

            // Print the raw response data
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawResponse)")
            } else {
                print("Unable to convert response data to string.")
            }

            // Parse the JSON response
            do {
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Parsed response: \(responseObject)")
            } catch {
                // Print detailed error information
                print("JSON parsing error: \(error.localizedDescription)")
                let nsError = error as NSError
                print("Error Code: \(nsError.code)")
                print("Error Domain: \(nsError.domain)")
                if let debugDescription = nsError.userInfo[NSDebugDescriptionErrorKey] as? String {
                    print("Debug Description: \(debugDescription)")
                }
            }
        }

        // Start the task
        task.resume()
    }
    
    func registerEmployer() {
        
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
        
        // Execute the URL request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check for errors in the response
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Ensure data is received
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Print the raw response data
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawResponse)")
            } else {
                print("Unable to convert response data to string.")
            }
            
            // Parse the JSON response
            do {
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Parsed response: \(responseObject)")
            } catch {
                // Print detailed error information
                print("JSON parsing error: \(error.localizedDescription)")
                let nsError = error as NSError
                print("Error Code: \(nsError.code)")
                print("Error Domain: \(nsError.domain)")
                if let debugDescription = nsError.userInfo[NSDebugDescriptionErrorKey] as? String {
                    print("Debug Description: \(debugDescription)")
                }
            }
        }
        
        // Start the task
        task.resume()
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
        
        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            
//            
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            
//            
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            
//            
//            if let rawResponse = String(data: data, encoding: .utf8) {
//                print("Raw response data: \(rawResponse)")
//            } else {
//                print("Unable to convert response data to string.")
//            }
//            
//            
//            do {
//                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("Parsed response: \(responseObject)")
//            } catch {
//                
//                print("JSON parsing error: \(error.localizedDescription)")
//                let nsError = error as NSError
//                print("Error Code: \(nsError.code)")
//                print("Error Domain: \(nsError.domain)")
//                if let debugDescription = nsError.userInfo[NSDebugDescriptionErrorKey] as? String {
//                    print("Debug Description: \(debugDescription)")
//                }
//            }
//        }
//        
//        
//        task.resume()
        
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let res = try JSONDecoder().decode(CandidateResponse.self, from: data)
            print("response \(res)")
            DispatchQueue.main.async {
                self.candidateRegistrationResponse = res
            }
        } catch{
            print("Error: \(error)")
        }
        
    }

}


