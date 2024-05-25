//
//  RegisterationViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 22/05/24.
//

import Foundation

struct RegistrationResponse {
    
    let responseMessage : ResponseMessage
    let responseStatus : Bool
    
    struct ResponseMessage {
        
        let viewerEmail : String
        let viewerName : String
        let viewerPass : String
        let viewerPhone : Int
    }
}

class RegistrationViewModel: ObservableObject {
    
    @Published var viewerName : String = ""
    @Published var viewerEmail : String = ""
    @Published var viewerCountryCode : String = ""
    @Published var viewerPhone : String = ""
    @Published var viewerPass : String = ""
    
    private let candidateURL = URL(string: "https://dev.cjnnow.com/api/create_candidate_profile")!
    private let employerURL = URL(string: "https://dev.cjnnow.com/api/add_employer")!
    private let viewerURL = URL(string: "https://dev.cjnnow.com/api/add_viewer")!

    init(){
        
    }
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
    
    func registerEmployer(name: String, email: String, companyName: String, postName: String, countryCode: String, phone: String, employerPass: String, yearsOfExperience: Int) {
        
        let payload: [String: AnyHashable] = [
            "employer_name": name,
            "employer_comp_name": companyName,
            "employer_post_name": postName,
            "country_code": countryCode,
            "employer_phone": phone,
            "employer_email": email,
            "employer_pass": employerPass,
            "employer_year_of_experience": yearsOfExperience
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
    
    func registerCandidate(name: String, email: String, countryCode: String, phone: String, candidatePass: String, gender: String, academicYear: String, dateOfBirth: String, department: String, collegeCode: String, highestQualification: String, skills: String, experience: String) {
            
        let payload: [String: AnyHashable] = [
            "candidate_name": name,
            "candidate_email": email,
            "country_code": countryCode,
            "candidate_phone": phone,
            "candidate_pass": candidatePass,
            "candidate_gender": gender,
            "candidate_acd_year": academicYear,
            "candidate_dob": dateOfBirth,
            "candidate_dept": department,
            "candidate_clg_code": collegeCode,
            "highest_qualification": highestQualification,
            "skills": skills,
            "experience": experience
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
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawResponse)")
            } else {
                print("Unable to convert response data to string.")
            }
            
            
            do {
                let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Parsed response: \(responseObject)")
            } catch {
                
                print("JSON parsing error: \(error.localizedDescription)")
                let nsError = error as NSError
                print("Error Code: \(nsError.code)")
                print("Error Domain: \(nsError.domain)")
                if let debugDescription = nsError.userInfo[NSDebugDescriptionErrorKey] as? String {
                    print("Debug Description: \(debugDescription)")
                }
            }
        }
        
        
        task.resume()
    }

}


