// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let medals = try? JSONDecoder().decode(Medals.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMedals { response in
//     if let medals = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Medals
struct Medals: Codable {
    let leaders: Leaders
    let medals: [Medal]
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLeaders { response in
//     if let leaders = response.result.value {
//       ...
//     }
//   }

// MARK: - Leaders
struct Leaders: Codable {
    let total, gold, silver, bronze: [Medal]
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMedal { response in
//     if let medal = response.result.value {
//       ...
//     }
//   }

// MARK: - Medal
struct Medal: Codable {
    let ref: String
    let id, name, displayName, slug: String
    let abbreviation: String
    let flag: Flag
    let medalStandings: MedalStandings

    enum CodingKeys: String, CodingKey {
        case ref = "$ref"
        case id, name, displayName, slug, abbreviation, flag, medalStandings
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFlag { response in
//     if let flag = response.result.value {
//       ...
//     }
//   }

// MARK: - Flag
struct Flag: Codable {
    let href: String
    let alt: String
    let rel: [Rel]
}

enum Rel: String, Codable {
    case countryFlag = "country-flag"
    case full = "full"
    case relDefault = "default"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseMedalStandings { response in
//     if let medalStandings = response.result.value {
//       ...
//     }
//   }

// MARK: - MedalStandings
struct MedalStandings: Identifiable, Codable {
    let id = UUID().uuidString
    let goldMedalCount, silverMedalCount, bronzeMedalCount, totalMedals: Int
}



func createMedalStandingsArray() -> [MedalStandings] {
    let medalStandingsArray: [MedalStandings] = [
        MedalStandings(goldMedalCount: 16, silverMedalCount: 8, bronzeMedalCount: 13, totalMedals: 37),
        
        // Add more MedalStandings as needed
    ]

    return medalStandingsArray
}
// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

