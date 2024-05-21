//
//  ViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 21/05/24.
//

import Foundation
import SwiftUI
enum UserType : Int {
    case candidate = 0
    case employer = 1
    case viewer = 2
}
class LoginViewModel : ObservableObject {
    
    private let url = URL(string: "https://dev.cjnnow.com/api/login_usertype")
    
    func login(email : String, password : String , type : Int ) {
        
        let payload: [String: AnyHashable] = ["email": email, "password": password, "type": type]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: .fragmentsAllowed) else {
               print("Failed to serialize JSON")
               return
           }
        
        var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("987654321", forHTTPHeaderField: "apikey")
            request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
              
            guard let data = data ,error == nil else {
                return
            }
                
            do {
                let response = try? JSONSerialization.jsonObject(with: data,options: .allowFragments)
                print(response)
            }
            catch{
                print(error)
            }
            
            
            }
        task.resume()
    }
}
