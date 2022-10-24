//
//  APICaller.swift
//  Zelda Game Covers
//
//  Created by Benjamin Heflin on 10/23/22.
//

import Foundation

struct Constants {
    static let baseURL = "https://zelda.fanapis.com/api/"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getListOfZeldaGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/games") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(ListOfGamesResponse.self, from: data)
                completion(.success(results.data))
                
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
        
    }
}
