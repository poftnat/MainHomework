//
//  CategoriesLoader.swift
//  ApiHomework11
//
//  Created by Наталья Владимировна Пофтальная on 22.11.2023.
//

import Foundation

protocol CharactersLoaderDelegate {
    func loaded(characters: [Hero])
}

class CharactersLoader {
    
    var delegate: CharactersLoaderDelegate?
    
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
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            return
        }
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
//               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
//               let jsonDict = json as? NSDictionary {
//                var characters: [Result] = []
//                for (_, data) in jsonDict where data is NSDictionary {
//                    if let result = Result(data: data as! NSDictionary)
//                    { characters.append(result) }
//
//                }


//            if let error = error {
//                print(error)
//                return
//            }
//            guard let data = data else { return }
//
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
//            do {
//                let cartoonCharacters = try JSONDecoder().decode(Result.self, from: data)
//                print(cartoonCharacters.first?.name)
//            }
//            catch {
//                print(error)
//            }
