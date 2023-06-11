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

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    VStack(alignment:.leading, spacing: 0) {
                        // Use SeasonSelectorView to update stateSeasonSelect
                        SeasonSelectorView(networkManager: networkManager)
                            .onChange(of: networkManager.stateSeasonSelect, perform: { updatedSeason in
                                Task{
                                    await networkManager.Reload()
                                }
                            })
                        ForEach(0..<networkManager.medals.count, id: \.self) { i in
                            NavigationLink {
                                CountryDetailView(index: i)
                            } label: {
                                CountryLineView(index: i)
                            }.foregroundColor(.white)
                        }
                    }.padding()
                }
            }
        }
        .navigationBarTitle("Olympics Medals")
        
    }
}




