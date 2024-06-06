//
//  AdvertisementViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 05/06/24.
//

import Foundation

class AdvertisementViewModel : ObservableObject {
    @Published var advertisements : [Advertisement] = []
    
    private let advertisementURL = URL(string: "https://dev.cjnnow.com/api/list_advertisement")!
    
    func fetchAdvertisements() async {
        var request = URLRequest(url:advertisementURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("SYXMcLRzqq1VRby6xISkrn3ieu8kmkHVWW37sRWK2b831424", forHTTPHeaderField: "apiKey")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
             advertisements = try JSONDecoder().decode([Advertisement].self, from: data)
                print("\(response)")
               print("\(advertisements)")
        } catch {
            print(error.localizedDescription)
        }
    }
}
