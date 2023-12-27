// MovieCellView.swift
// MovieListCVS
//
// Created by Danylo Malovichko on 26.12.2023.

import SwiftUI

struct MovieCellView: View {
    
    @StateObject var viewModel: MovieCellVM
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(viewModel: .init(viewModel.container, movie: viewModel.movie))) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    
                    Image(viewModel.movie.posterImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text("\(viewModel.movie.title) ")
                            .foregroundColor(.black)
                            .font(.headline)
                        +
                        Text("(\(viewModel.movie.releaseDate.year))")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("\(viewModel.movie.duration) · ")
                            .foregroundColor(.gray)
                        +
                        Text("\(viewModel.movie.genre)")
                            .foregroundColor(.gray)
                        Spacer()
                        
                        
                        if viewModel.movie.isInWatchlist == true {
                            Text("On my watchlist")
                                .foregroundColor(.gray)
                                .bold()
                        }
                    }
                    
                    Spacer()
                }
                .padding(8)
                
                Divider()
                    .background(.gray)
                    .padding(.horizontal, 10)
            }
            .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    
}
