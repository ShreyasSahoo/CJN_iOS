//
//  FeedbackViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 27/05/24.
//

import Foundation

class FeedbackViewModel : ObservableObject {
    @Published var feedback : Feedback? = nil
    
    private let feedbackURL = URL(string: "https://dev.cjnnow.com/api/listFeedback")!
    
    func fetchFeedback() async {
        var request = URLRequest(url:feedbackURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("SYXMcLRzqq1VRby6xISkrn3ieu8kmkHVWW37sRWK2b831424", forHTTPHeaderField: "apiKey")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
//            let responseObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            print("\(responseObject)")
            
             feedback = try JSONDecoder().decode(Feedback.self, from: data)
                print("\(response)")
            print("\(String(describing: feedback))")
        } catch {
            print(error.localizedDescription)
        }
    }
}
