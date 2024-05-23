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
    
    private let loginURL = URL(string: "https://dev.cjnnow.com/api/login_usertype")!
    
    func login(email: String, password: String, type: Int, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        
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
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
               
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
