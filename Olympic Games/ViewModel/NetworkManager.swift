//
//  NetworkManager.swift
//  Olympic Games
//
//  Created by Benjamin Effosse on 03/06/2023.
//

import Foundation

//https://site.api.espn.com/apis/site/v2/olympics/winter/2022/medals
//https://site.api.espn.com/apis/site/v2/olympics/winter/2022/athletes?athlete=61697
//https://site.api.espn.com/apis/site/v2/olympics/winter/2022/medals?country=58

import Alamofire

import Combine

class NetworkManager: ObservableObject {
    @Published var medals = [Medal]()
    @Published var loading = false
    @Published var stateSeasonSelect: String = "winter/2022/"
    @Published var showErrorAlert = false
    private let api_key = ""
    private let api_url_base = "https://site.api.espn.com/apis/site/v2/olympics/"
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
        AF.request("\(api_url_base)\(stateSeasonSelect)\(api_url_end)")
            .responseDecodable(of: Medals.self) { (response: DataResponse<Medals, AFError>) in
                switch response.result {
                case .success(let medalsResponse):
                    DispatchQueue.main.async {
                        self.medals = medalsResponse.medals
                        self.loading = false
                        print("Loading")
                        print("\(self.api_url_base)\(self.stateSeasonSelect)\(self.api_url_end)")
                        print(self.medals.count)
                    }
                case .failure(let error):
                    // Handle Alamofire request error
                    print("Alamofire request error: \(error)")
 
                }
        }
    }

    func Reload() async {
        AF.request("\(api_url_base)\(stateSeasonSelect)\(api_url_end)")
            .responseDecodable(of: Medals.self) { (response: DataResponse<Medals, AFError>) in
                switch response.result {
                case .success(let medalsResponse):
                    DispatchQueue.main.async {
                        self.medals = medalsResponse.medals
                        self.loading = false
                        print("Reload")
                        print("\(self.api_url_base)\(self.stateSeasonSelect)\(self.api_url_end)")
                        print(self.medals.count)
                    }
                case .failure(let error):
                    // Handle Alamofire request error
                    print("Alamofire request error: \(error)")
                    
                    // Display a message to the user
                    // For example, you can use an alert or update a property to trigger a message in your view
                    // Example using an alert:
                    DispatchQueue.main.async {
                        // Set a flag to trigger showing the alert in your view
                        self.showErrorAlert = true
                    }
                }
        }
    }

}
