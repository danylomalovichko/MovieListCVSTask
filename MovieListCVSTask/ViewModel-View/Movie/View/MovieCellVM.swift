//
//  MovieCellVM.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import Foundation

@MainActor
class MovieCellVM: ObservableObject {
    
    let movie: Movie
    let container: DependencyContainer
        
    init(_ container: DependencyContainer, movie: Movie) {
        self.container = container
        self.movie = movie
    }
}
