//
//  CountryLineView.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 03/06/2023.
//

import SwiftUI
import Kingfisher

struct CountryLineView: View {
    @ObservedObject var networkManager = NetworkManager()
    var index = Int()
    var body: some View {
        
        HStack{
            if networkManager.loading {
                Text("Loading...")
            } else {
                 
                        HStack (alignment: .center, spacing: 12){
                            KFImage(URL(string: networkManager.medals[index].flag.href))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .padding(.trailing)
                            Text(networkManager.medals[index].name)
                                .font(.headline)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            Spacer()
                            
                            VStack{
                                Image("gold")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(width: 30)
                                Image("silver")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(width: 30)
                                Image("bronze")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(width: 30)
                            }
                            VStack(alignment: .trailing, spacing: 18){
                                Text("\(CGFloat(networkManager.medals[index].medalStandings.goldMedalCount),specifier: "%.0f")")
                                    .font(.footnote)
                                    .multilineTextAlignment(.trailing)
                                Text("\(CGFloat(networkManager.medals[index].medalStandings.silverMedalCount),specifier: "%.0f")")
                                    .font(.footnote)
                                    .multilineTextAlignment(.trailing)
                                Text("\(CGFloat(networkManager.medals[index].medalStandings.bronzeMedalCount),specifier: "%.0f")")
                                    .font(.footnote)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        .padding().background(Color("BG"))
                        .cornerRadius(8)
               
                .padding()

            }
        }
    }
}

struct CountryLineView_Previews: PreviewProvider {
    static var previews: some View {
        CountryLineView()
    }
}
