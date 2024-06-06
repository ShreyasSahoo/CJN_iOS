//
//  DashboardViewModel.swift
//  CJN_iOS
//
//  Created by Shreyas Sahoo on 05/06/24.
//

import Foundation
class DashboardViewModel : ObservableObject {
    @Published var dashboard : [Dashboard] = []
    
    private var dashboardURLString = "https://dev.cjnnow.com/api/listDashboard/"
    
    func fetchDashboard(_ id : String ) async {
        let dashboardURL = URL(string: dashboardURLString + id)
        var request = URLRequest(url: dashboardURL ?? URL(string: "https://dev.cjnnow.com/api/listDashboard/1")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("SYXMcLRzqq1VRby6xISkrn3ieu8kmkHVWW37sRWK2b831424", forHTTPHeaderField: "apiKey")
        
        do {
            let (data , response) = try await URLSession.shared.data(for: request)
            
            dashboard = try JSONDecoder().decode([Dashboard].self, from: data)
            
            print(String(describing: dashboard))
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
