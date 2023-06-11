//
//  ContentView.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 03/06/2023.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    var body: some View {
        VStack(spacing:0) {
            
            NavigationView {
                CountryListView()
            }
        }
        
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
