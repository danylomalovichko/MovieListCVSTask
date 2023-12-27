//
//  SortType.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import Foundation

enum SortType: Hashable, CaseIterable {
    case name
    case releaseDate
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .releaseDate:
            return "Release Date"
        }
    }
}
