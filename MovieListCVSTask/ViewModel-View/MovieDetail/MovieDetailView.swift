//
//  MovieDetailView.swift
//  MovieListCVS
//
//  Created by Danylo Malovichko on 27.12.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.openURL) var openURL
    
    @StateObject var viewModel: MovieDetailVM
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(viewModel.movie.posterImage)
                    .resizable()
                    .cornerRadius(12)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 200)
                
                VStack {
                    HStack {
                        Text(viewModel.movie.title)
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.black)
                            .frame(maxHeight: .infinity)
                            .font(.system(size: 22))
                            .bold()
                        
                        Text(viewModel.movie.rating, format: .number)
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                            .bold()
                        +
                        Text("/10")
                            .foregroundColor(.gray)
                        
                    }
                    
                    HStack {
                        Button(action: {
                            viewModel.toggleWatchList()
                        }) {
                            Text(viewModel.movie.isInWatchlist ? "Remove from Watchlist" : "Add to Watchlist")
                                .minimumScaleFactor(0.4)
                                .lineLimit(1)
                                .padding(.horizontal, 20)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.black.opacity(0.5))
                                .background(.gray.opacity(0.5))
                                .cornerRadius(20)
                        }
                        
                        Spacer()
                        
                    }
                    
                    HStack {
                        Button {
                            openURL(viewModel.movie.trailer)
                        } label: {
                            Text("WATCH TRAILER")
                                .padding(.horizontal, 20)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.black)
                                .bold()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1))
                        }
                        
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 16)
            
            Divider()
                .background(.gray)
                .padding(.horizontal, 10)
            
            HStack {
                Text("Short description")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal, 15)
            
            Text(viewModel.movie.description)
                .foregroundColor(.black.opacity(0.5))
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal, 15)
            
            Divider()
                .background(.gray)
                .padding(.horizontal, 10)
            
            HStack {
                Text("Details")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                    .bold()
                
                Spacer()
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Genre")
                            .bold()
                            .foregroundColor(.black)
                    }
                    HStack {
                        Spacer()
                        Text("Released date")
                            .bold()
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                }
                
                VStack {
                    HStack {
                        Text(viewModel.movie.genre)
                            .foregroundColor(.black.opacity(0.5))
                            .minimumScaleFactor(0.8)
                            .lineLimit(1)
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.movie.releaseDate.yearAndMonth)
                            .foregroundColor(.black.opacity(0.5))
                        Spacer()
                    }
                    Spacer()
                }
            }
            Spacer()
                .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle(viewModel.movie.title, displayMode: .inline)
    }
}
