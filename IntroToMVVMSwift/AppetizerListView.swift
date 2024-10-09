//
//  AppetizerListView.swift
//  IntroToMVVMSwift
//
//  Created by Alexander Gerus on 24.04.2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers, id: \.id) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                .navigationTitle(" Appetizers")
            }
            .onAppear { viewModel.getAppetizers() }
            
            if viewModel.isLoading { LoadingView() }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
