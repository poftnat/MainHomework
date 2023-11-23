////
////  CharactersSource.swift
////  MainHomework
////
////  Created by Наталья Владимировна Пофтальная on 23.11.2023.
////
//
import Foundation

struct ResponceData: Decodable {
    let characters: [Result]
    
    private enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
    
    init(characters: [Result]) {
        self.characters = characters
    }
}

struct Result: Decodable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Decodable {
    let name: String
    let url: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}




//
//struct Result: Codable {
//    let id: Int
//    let name: String
//    let status: Status
//    let species: Species
//    let type: String
//    let gender: Gender
//    let location: Location
//    let image: String
//    let episode: [String]
//
//    init?(data: NSDictionary) {
//        guard let id = data["id"] as? Int,
//              let name = data["name"] as? String,
//              let status = data["status"] as? Status,
//              let species = data["species"] as? Species,
//              let type = data["type"] as? String,
//              let gender = data["gender"] as? Gender,
//              let location = data["location"] as? Location,
//              let image = data["image"] as? String,
//              let episode = data["episode"]
//              as? String else { return nil }
//
//        self.id = id
//        self.name = name
//        self.status = status
//        self.species = species
//        self.type = type
//        self.gender = gender
//        self.location = location
//        self.image = image
//        self.episode = [episode]
//    }
//
//}
//
//enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "unknown"
//}
//
//struct Location: Codable {
//    let name: String
//    let url: String
//}
//
//enum Species: String, Codable {
//    case alien = "Alien"
//    case human = "Human"
//}
//
//enum Status: String, Codable {
//    case alive = "Alive"
//    case dead = "Dead"
//    case unknown = "unknown"
//}
//
//
