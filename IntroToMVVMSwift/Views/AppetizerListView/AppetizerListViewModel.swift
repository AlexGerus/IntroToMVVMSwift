//
//  AppetizerListViewModel.swift
//  IntroToMVVMSwift
//
//  Created by Alexander Gerus on 24.04.2023.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {

    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        self.isLoading = true
        
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
