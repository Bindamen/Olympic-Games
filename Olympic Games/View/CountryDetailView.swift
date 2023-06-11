//
//  CountryDetailView.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 16/01/2024.
//

import SwiftUI
import Kingfisher
import Charts

@available(iOS 17.0, *)
struct CountryDetailView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var medalStandingsArray = createMedalStandingsArray()
    
    var index = Int()
     
    
    var body: some View {
        NavigationStack{
            VStack(spacing:12,content: {
                Text("OVERALL MEDAL LEADERS")
                
                
                VStack{
                    ZStack{
                        VStack{
                            Text("Total")
                                .font(.largeTitle)
                                .fontWeight(.black)
                            Text("\(CGFloat(networkManager.medals[index].medalStandings.totalMedals),specifier: "%.0f")")
                                .font(.headline)
                            KFImage(URL(string: networkManager.medals[index].flag.href))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                            
                        }.padding(4)
                        Chart(){
                            ForEach(medalStandingsArray) { array in
                                SectorMark(angle: .value("Medals", 3),
                                               innerRadius: .ratio(0.8),
                                               angularInset: 1)
                                .foregroundStyle(by: .value("Split", 3 ))
                                
                                
                            }
                            
                        }.chartLegend(.hidden)
                    }
                HStack(spacing:12){
                    
                    ZStack{
                        VStack{
                            Text("Gold")
                            Text("\(CGFloat(networkManager.medals[index].medalStandings.goldMedalCount),specifier: "%.0f")")
                                .font(.headline)
                                .fontWeight(.black)
                            Image("gold")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }.padding(4)
                        Chart{
    
                                SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.goldMedalCount),
                                           innerRadius: .ratio(0.8),
                                           angularInset: 1)
                                            .foregroundStyle(Color.yellow)
                               // .foregroundStyle(by: .value("gold", networkManager.medals[index].medalStandings.goldMedalCount))
                        }
                    }
                    ZStack{
                        VStack{
                            Text("Silver")
                            Text("\(CGFloat(networkManager.medals[index].medalStandings.silverMedalCount),specifier: "%.0f")")
                                .font(.headline)
                                .fontWeight(.black)
                            Image("silver")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }.padding(4)
                        Chart{
                            
                                SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.goldMedalCount),
                                           innerRadius: .ratio(0.8),
                                           angularInset: 1)
                                .foregroundStyle(Color.gray)
                            //    .foregroundStyle(by: .value("gold", networkManager.medals[index].medalStandings.goldMedalCount))
                        }
                    }
                    ZStack{
                        VStack{
                            Text("Bronze")
                            Text("\(CGFloat(networkManager.medals[index].medalStandings.bronzeMedalCount),specifier: "%.0f")")
                                .font(.headline)
                                .fontWeight(.black)
                            Image("bronze")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }.padding(4)
                        Chart{

                                SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.bronzeMedalCount),
                                           innerRadius: .ratio(0.8),
                                           angularInset: 1)
                                .foregroundStyle(Color.brown)
                           //     .foregroundStyle(by: .value("gold", networkManager.medals[index].medalStandings.goldMedalCount))
                        }
                    }
                }
                Spacer()
            }
            })
            
        }.navigationTitle(networkManager.medals[index].displayName)
    }
}

