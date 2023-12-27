// ContentView.swift
// MovieListCVS
//
// Created by Danylo Malovichko on 21.12.2023.

import SwiftUI

struct MovieView: View {
    @StateObject var viewModel: MovieVM
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Movies")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size: 32))
                        .padding(.leading, 8)
                    
                    Spacer()
                    
                    Picker("Sort By", selection: $viewModel.selectedSortType) {
                        ForEach(viewModel.sortTypes, id: \.self) { type in
                            Text(type.title)
                        }
                    }
                    .tint(.black)
                    .pickerStyle(.menu)
                }
                
                ScrollView {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        MovieCellView(viewModel: .init(viewModel.container, movie: movie))
                    }
                }
            }
            .background(.white)
        }
    }
}
