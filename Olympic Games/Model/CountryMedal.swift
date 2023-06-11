// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryMedal = try? JSONDecoder().decode(CountryMedal.self, from: jsonData)

import Foundation

// MARK: - CountryMedal
struct CountryMedal: Codable {
    let medalsMedals: MedalsMedals
   // let leaders: Leaders
    
    enum CodingKeys: String, CodingKey {
        case medalsMedals = "medals"
      //  case link
    }
}
/*
// MARK: - Leaders
struct Leaders: Codable {
    let total, gold, silver, bronze: [Bronze]
}

// MARK: - Bronze
struct Bronze: Codable {
    let id, name, displayName, slug: String
    let abbreviation: Abbreviation
    let flag: Flag
    let medalStandings: MedalStandings
}
*/
enum Abbreviation: String, Codable {
    case nor = "NOR"
}
/*
// MARK: - Flag
struct Flag: Codable {
    let href: String
    let alt: String
    let rel: [FlagRel]
}
*/
enum FlagRel: String, Codable {
    case countryFlag = "country-flag"
    case full = "full"
    case relDefault = "default"
}
/*
// MARK: - MedalStandings
struct MedalStandings: Codable {
    let goldMedalCount, silverMedalCount, bronzeMedalCount, totalMedals: Int
}
*/
// MARK: - Medals
struct MedalsMedals: Codable {
    let g, s, b: [B]

    enum CodingKeys: String, CodingKey {
        case g = "G"
        case s = "S"
        case b = "B"
    }
}

// MARK: - B
struct B: Codable {
    let athlete: AthleteAthlete?
    let sequenceNumber, place, startPosition: Int?
    let result: String
  //  let medal: Medal
 //   let resultGroup: Abbreviation?
  //  let competitionType: CompetitionType
    let description, discipline: String
  //  let links: [LinkLink]
    let athletes: [AthleteAthlete]?
}


// MARK: - Athlete
struct AthleteAthlete: Codable {
    let displayName, id: String
  //  let link: LinkLink
}

// MARK: - Link
struct LinkLink: Codable {
    let language: Language
    let rel: [LinkRel]
    let href: String
    let text, shortText: TextText
    let isExternal, isPremium: Bool
}

enum Language: String, Codable {
    case enUS = "en-US"
}

enum LinkRel: String, Codable {
    case athlete = "athlete"
    case desktop = "desktop"
    case event = "event"
    case playercard = "playercard"
    case results = "results"
}

enum TextText: String, Codable {
    case playerCard = "Player Card"
    case results = "Results"
}

enum CompetitionType: String, Codable {
    case group = "group"
    case individual = "individual"
    case team = "team"
}

enum MedalMedal: String, Codable {
    case b = "B"
    case g = "G"
    case s = "S"
}

