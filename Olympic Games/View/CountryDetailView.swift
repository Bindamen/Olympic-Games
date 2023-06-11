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
    @State var g = [B]()
    @State var s = [B]()
    @State var b = [B]()
    @State private var isDataLoaded = false
    
    
    var index = Int()
    
    
    var body: some View {
        
        
        
        ScrollView{
            VStack(spacing:32,content: {
                
                ZStack{
                    VStack(spacing:0){
                        Text("Total")
                            .font(.headline)
                        
                        Text("\(CGFloat(networkManager.medals[index].medalStandings.totalMedals),specifier: "%.0f")")
                            .font(.headline)
                            .fontWeight(.black)
                        KFImage(URL(string: networkManager.medals[index].flag.href))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    }
                    
                    Chart(){
                        let data = [
                            MedalsCount(medal: networkManager.medals[index].medalStandings.goldMedalCount, color:.yellow),
                            MedalsCount(medal: networkManager.medals[index].medalStandings.silverMedalCount, color:.gray),
                            MedalsCount(medal: networkManager.medals[index].medalStandings.bronzeMedalCount, color:.brown)
                        ]
                        ForEach(data, id:\.self) { i in
                            
                            SectorMark(angle: .value("Medals", i.medal),
                                       innerRadius: .ratio(0.9),
                                       angularInset: 1)
                                            .foregroundStyle( i.color )
                            
                        }
                    }
                    .chartLegend(.hidden)
                    
                    
                }
                HStack(spacing:12){
                    
                    ZStack{
                        VStack{
                            
                            Text("\(CGFloat(networkManager.medals[index].medalStandings.goldMedalCount),specifier: "%.0f")")
                                .font(.headline)
                                .fontWeight(.black)
                            
                        }.padding(4)
                        Chart{
                            
                            SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.goldMedalCount),
                                       innerRadius: .ratio(0.7),
                                       angularInset: 0.5)
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
                            
                        }.padding(4)
                        Chart{
                            
                            SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.silverMedalCount),
                                       innerRadius: .ratio(0.7),
                                       angularInset: 0.5)
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
                            
                        }.padding(4)
                        Chart{
                            
                            SectorMark(angle: .value("Medals", networkManager.medals[index].medalStandings.bronzeMedalCount),
                                       innerRadius: .ratio(0.7),
                                       angularInset: 0.5)
                            .foregroundStyle(Color.brown)
                            //     .foregroundStyle(by: .value("gold", networkManager.medals[index].medalStandings.goldMedalCount))
                        }
                    }
                }
                
                
                if g .isEmpty{
                    
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment:.center){
                            Image("gold")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                        ForEach(g.indices, id: \.self) { gold in
                            VStack(spacing: 4) {
                                HStack {
                                    Text("\(g[gold].discipline) - \(g[gold].description)")
                                        .fontWeight(.black)
                                    Spacer()
                                }
                                
                                if let athletes = g[gold].athletes {
                                    ForEach(athletes.indices, id: \.self) { group in
                                        HStack {
                                            Text(athletes[group].displayName)
                                                .fontWeight(.light)
                                            Spacer()
                                            Text(g[gold].result)
                                        }
                                    }
                                } else {
                                    HStack {
                                        Text(g[gold].athlete?.displayName ?? "")
                                            .fontWeight(.light)
                                        Spacer()
                                        Text(g[gold].result)
                                    }
                                }
                            }
                            .padding(8)
                            Divider()
                        }
                    }.padding(4)
                      
                }
                if s .isEmpty{
                    
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment:.center){
                            Image("silver")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                        ForEach(s.indices, id: \.self) { silver in
                            VStack(spacing: 4) {
                                HStack {
                                    Text("\(s[silver].discipline) - \(s[silver].description)")
                                        .fontWeight(.black)
                                    Spacer()
                                }
                                
                                if let athletes = s[silver].athletes {
                                    ForEach(athletes.indices, id: \.self) { group in
                                        HStack {
                                            Text(athletes[group].displayName)
                                                .fontWeight(.light)
                                            Spacer()
                                            Text(s[silver].result)
                                        }
                                    }
                                } else {
                                    HStack {
                                        Text(s[silver].athlete?.displayName ?? "")
                                            .fontWeight(.light)
                                        Spacer()
                                        Text(s[silver].result)
                                    }
                                }
                            }
                            .padding(8)
                            Divider()
                        }
                    }.padding(4)
                       
                }
                if b .isEmpty {
                    
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment:.center){
                            Image("bronze")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                        ForEach(b.indices, id: \.self) { bronze in
                            VStack(spacing: 4) {
                                HStack {
                                    Text("\(b[bronze].discipline) - \(b[bronze].description)")
                                        .fontWeight(.black)
                                    Spacer()
                                }
                                
                                if let athletes = b[bronze].athletes {
                                    ForEach(athletes.indices, id: \.self) { group in
                                        HStack {
                                            Text(athletes[group].displayName)
                                                .fontWeight(.light)
                                            Spacer()
                                            Text(b[bronze].result)
                                        }
                                    }
                                } else {
                                    HStack {
                                        Text(b[bronze].athlete?.displayName ?? "")
                                            .fontWeight(.light)
                                        Spacer()
                                        Text(b[bronze].result)
                                    }
                                }
                            }
                            .padding(8)
                            Divider()
                        }
                    }.padding(4)
                       
                }
                
            }
                   
            ).frame(maxWidth:.infinity)
                .navigationBarTitleDisplayMode(.automatic)
                .navigationTitle(networkManager.medals[index].displayName)
        }.onAppear(perform: {
            loadMeadals()
        })
    }
    
    func loadMeadals()  {
        
        guard let url = URL(string: "https://site.api.espn.com/apis/site/v2/olympics/\(networkManager.stateSeasonSelect)medals?country=\(networkManager.medals[index].id)") else {
            print ("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let medalsCountry = try? JSONDecoder().decode(CountryMedal.self, from: data){
                    
                    DispatchQueue.global(qos: .background).async {
                        self.g = medalsCountry.medalsMedals.g
                        self.s = medalsCountry.medalsMedals.s
                        self.b = medalsCountry.medalsMedals.b
                        
                        print(url)
                    }
                    return
                }
            }
            
            print("Fetched failed: \(error?.localizedDescription ?? "Unknown error data Medals")")
        }.resume()
    }
    
    
}


struct MedalsCount: Identifiable, Hashable{
    
    let id = UUID()
    let medal: Int
    let color: Color
    
}
