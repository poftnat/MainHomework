//
//  NetworkService.swift
//  ApiHomework11
//
//  Created by Наталья Владимировна Пофтальная on 22.11.2023.
//

import Foundation

final class NetworkService {
        
    func loadCharacters(completion: @escaping ([Hero]) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            
            if let data = data {
                do {
                    let characters = try JSONDecoder().decode(ResponceData.self, from: data)
                    completion(characters.characters) //
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getCharacterData(id: Int, completion: @escaping(Hero) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data {
                do {
                    let nameCharacter = try JSONDecoder().decode(Hero.self, from: data)
                    completion(nameCharacter)
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
