//
//  CountryListView.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 03/06/2023.
//

import SwiftUI
import Kingfisher

@available(iOS 17.0, *)
struct CountryListView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var showErrorAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    VStack(alignment:.leading, spacing: 0) {
                        // Use SeasonSelectorView to update stateSeasonSelect
                        
                                SeasonSelectorView(networkManager: networkManager)
                        
                        ForEach(0..<networkManager.medals.count, id: \.self) { i in
                            NavigationLink {
                                CountryDetailView(networkManager: networkManager,index: i)
                            } label: {
                                CountryLineView(networkManager: networkManager,index: i)
                            }.foregroundColor(.white)
                        }
                        
                    }.padding()
                        .alert("Error", isPresented: $networkManager.showErrorAlert) {
                            Button("OK", role: .cancel) {}
                        } message: {
                            Text("Failed to reload data")
                        }
                        .onAppear {
                            // Call Reload() when the view appears
                            Task {
                                do {
                                    // Attempt to reload data
                                    try await networkManager.Reload()
                                } catch {
                                    // If an error occurs, set showErrorAlert to true to display the alert
                                    networkManager.showErrorAlert = true
                                }
                            }
                        }
                    
                }
                
            }
            
        }
        .navigationBarTitle("Olympics Medals")
        
    }
}




