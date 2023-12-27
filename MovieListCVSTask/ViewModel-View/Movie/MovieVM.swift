//
//  MovieVM.swift
//  MovieListCVS
//
//  Created by Danylo Malovichko on 26.12.2023.
//

import Foundation
import SwiftUI

@MainActor
class MovieVM: BaseVM {
    
    @Published var movies: [Movie] = []
    @Published var selectedSortType: SortType = .name
    @Published var sortTypes: [SortType]
    
    override init(_ container: DependencyContainer) {
        sortTypes = SortType.allCases
        super.init(container)
        
        container.dataService.movies
            .assign(to: &$movies)
        
        $selectedSortType
            .sink { type in
                container.dataService.sortMovies(type)
            }
            .store(in: &bag)
        
    }
}
