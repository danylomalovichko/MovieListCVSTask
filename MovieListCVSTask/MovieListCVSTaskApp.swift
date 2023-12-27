//
//  MovieListCVSTaskApp.swift
//  MovieListCVSTask
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import SwiftUI

@main
struct MovieListCVSTaskApp: App {
    @StateObject var appState = AppState(container: DependencyContainer())
    var body: some Scene {
        WindowGroup {
            MovieView(viewModel: .init(appState.container))
        }
    }
}
