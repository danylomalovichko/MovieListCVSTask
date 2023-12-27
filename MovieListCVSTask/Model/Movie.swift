//
//  Movie.swift
//  MovieListCVS
//
//  Created by Danylo Malovichko on 21.12.2023.
//

import Foundation

struct Movie: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
    let posterImage: String
    let description: String
    let rating: Double
    let duration: String
    let genre: String
    let releaseDate: Date
    let trailer: URL
    var isInWatchlist: Bool
}
