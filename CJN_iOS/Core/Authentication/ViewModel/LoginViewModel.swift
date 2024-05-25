//
//  ViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import Foundation
import SwiftUI

struct LoginResponse: Codable {
    let responseMessage: String
    let responseStatus: Bool
}

enum UserType: Int, Codable {
    case candidate = 0
    case employer = 1
    case viewer = 2
}

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loginResponse = LoginResponse(responseMessage: "", responseStatus: false)
    
    init(email: String = "", password: String = "", errorMessage: String = "", loginResponse: LoginResponse) {
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
        self.loginResponse = loginResponse
    }
    private let loginURL = URL(string: "https://dev.cjnnow.com/api/login_usertype")!
    
    func login( type : Int ) async {
            
            let payload: [String: AnyHashable] = ["email": email, "password": password, "type": type]
            guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed) else {
                   print("Failed to serialize JSON")
                   return
               }
            
            var request = URLRequest(url: loginURL)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("987654321", forHTTPHeaderField: "apikey")
                request.httpBody = jsonData
            
                do {
                    let (data, res) = try await URLSession.shared.data(for: request)
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    print("response \(res)")
                    DispatchQueue.main.async {
                        self.loginResponse = response
                    }
                } catch {
                    print("Error: \(error)")
                }
           
           
        }
}
