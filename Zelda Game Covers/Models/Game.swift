//
//  Game.swift
//  Zelda Game Covers
//
//  Created by Benjamin Heflin on 10/23/22.
//

import Foundation

struct ListOfGamesResponse: Codable {
    let count: Int
    let data: [Game]
}

struct Game: Codable {
    let description: String?
    let developer: String?
    let id: String?
    let name: String?
    let publisher: String?
    let release_date: String?
}
