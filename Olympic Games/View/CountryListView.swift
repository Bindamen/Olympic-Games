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
            VStack(spacing: 0){
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    VStack(alignment:.leading, spacing: 0) {
                        ForEach(0..<networkManager.medals.count, id:\.self) { i in
                            NavigationLink {
                                CountryDetailView(index: i)
                            } label: {
                                CountryLineView(index:i)
                            }.foregroundColor(.white)

                           
                        }
                      
                    }.padding()
                }
            }
        }.navigationBarTitle("Olympics Medals")
    }
}
@available(iOS 17.0, *)
struct CountryListView_preview: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}



