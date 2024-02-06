//
//  SeasonSelectorView.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 26/01/2024.
//

import SwiftUI

@available(iOS 15.0, *)
struct SeasonSelectorView: View {
    
    @StateObject var networkManager: NetworkManager // Use @ObservedObject to observe changes
    var season = ["summer/2012/", "summer/2016/", "winter/2018/", "summer/2020/", "winter/2022/", "summer/2024/"]
    
    func getRealSeasonName(season: String) -> String {
        switch season {
        case "summer/2012/": return "Summer 2012"
        case "summer/2016/": return "Summer 2016"
        case "winter/2018/": return "Winter 2018"
        case "summer/2020/": return "Summer 2020"
        case "winter/2022/": return "Winter 2022"
        case "summer/2024/": return "Summer 2024"
        default: return "nil"
        }
    }
    
    var body: some View {
        HStack {
            
                    Picker("Select Season", selection: $networkManager.stateSeasonSelect) {
                        ForEach(season, id: \.self) { season in
                            Text(getRealSeasonName(season: season)).padding(.horizontal, 2)
                        }.onChange(of: networkManager.stateSeasonSelect, perform: { updatedSeason in
                            Task{
                                await networkManager.Reload()
                            }
                        })

                 
                .tint(.red)
                
            }.pickerStyle(.menu)

             
        }.padding(.bottom)
    }
}
