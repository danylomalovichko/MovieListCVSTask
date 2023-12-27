//
//  DependencyContainer.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 02.09.2023.
//

import Foundation

@MainActor
class DependencyContainer {
    
   let dataService: DataService

    init() {
        dataService = DataManager()
    }
}
