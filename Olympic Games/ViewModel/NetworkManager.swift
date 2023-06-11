//
//  NetworkManager.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 03/06/2023.
//

import Foundation


//https://site.api.espn.com/apis/site/v2/olympics/winter/2022/medals
//https://site.api.espn.com/apis/site/v2/olympics/winter/2022/athletes?athlete=61697

import Alamofire

import Combine

class NetworkManager: ObservableObject {
    @Published var medals = [Medal]()
    @Published var loading = false
    private let api_key = ""
    private let api_url_base = "https://site.api.espn.com/apis/site/v2/olympics/"
    private let season = "winter/"
    private let year = "2022/"
    private let api_url_end = "medals"
    init() {
        loading = true
        loadDataByAlamofire()
    }
    
    private func loadDataNormal() {
        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let medals = try! JSONDecoder().decode(Medals.self, from: data)
            DispatchQueue.main.async {
                self.medals = medals.medals
                self.loading = false
            }
        }.resume()
    }
    
    private func loadDataByAlamofire() {
        AF.request("\(api_url_base)\(season)\(year)\(api_url_end)")
            .responseDecodable(of: Medals.self){ response in
                guard let data = response.data else { return }
                let medals = try! JSONDecoder().decode(Medals.self, from: data)
                
                DispatchQueue.main.async {
                    self.medals = medals.medals
                    self.loading = false
                }
        }
    }
    func Reload() async {
        AF.request("\(api_url_base)\(season)\(year)\(api_url_end)")
            .responseDecodable(of: Medals.self){ response in
                guard let data = response.data else { return }
                let medals = try! JSONDecoder().decode(Medals.self, from: data)
                DispatchQueue.main.async {
                    self.medals = medals.medals
                    self.loading = false
                    print("Reload")
                }
            }.resume()
    }
    
 
        
        

}
