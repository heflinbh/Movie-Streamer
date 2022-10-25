//
//  APICaller.swift
//  Zelda Game Covers
//
//  Created by Benjamin Heflin on 10/23/22.
//

import Foundation

struct Constants {
    static let baseURL = "https://zelda.fanapis.com/api/"
    static let gameAPI = "games/"
    static let nameAPI = "?name="
    
    static let YouTubeAPI_KEY = "AIzaSyAYnTQGXXXQS8X_MJH8tOhovQ0Xn2c4_PE"
    static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getListOfZeldaGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.gameAPI)") else {return}
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
    
    func getSearchZeldaGames(with query: String, completion: @escaping (Result<[Game], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL + Constants.gameAPI + Constants.nameAPI + query)") else {return}
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
    
    
    func getVideo(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTubeAPI_KEY)") else {return}
        
    
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YouTubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
