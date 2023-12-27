//
//  DataService.swift
//  MovieListCVS
//
//  Created by Danylo Malovichko on 03.10.2023.
//

import Foundation
import Combine

@MainActor
protocol DataService {
    var movies: CurrentValueSubject<[Movie], Never> { get }
    func sortMovies(_ type: SortType)
    func toggleWatchList(_ movieID: String) 
}

class DataManager: DataService {
        
    let movies = CurrentValueSubject<[Movie], Never>([])
    
    init() {
                
        movies.value = [
            Movie(
                title: "Tenet",
                posterImage: "TenetPoster",
                description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                rating: 7.8,
                duration: "2h 30min",
                genre: "Action, Sci-Fi",
                releaseDate: "2010-07-16".date,
                trailer: URL(string: "https://www.youtube.com/watch?v=LdOM0x0XDMo")!, isInWatchlist: false
            ),
            Movie(
                title: "Spider-Man: Into the Spider-Verse",
                posterImage: "SpiderManPoster",
                description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                rating: 8.4,
                duration: "1h 57min",
                genre: "Action, Animation, Adventure",
                releaseDate: "2018-12-14".date,
                trailer: URL(string: "https://www.youtube.com/watch?v=tg52up16eq0")!, isInWatchlist: false
            ),
            Movie(
                title: "Knives Out",
                posterImage: "KnivesOutPoster",
                description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                rating: 7.9,
                duration: "2h 10min",
                genre: "Comedy, Crime, Drama",
                releaseDate: "2019-11-27".date,
                trailer: URL(string: "https://www.youtube.com/watch?v=qGqiHJTsRkQ")!, isInWatchlist: false
            ),
            Movie(
                title: "Guardians of the Galaxy",
                posterImage: "GuardiansPoster",
                description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                rating: 8.0,
                duration: "2h 1min",
                genre: "Action, Adventure, Comedy",
                releaseDate: "2014-08-01".date,
                trailer: URL(string: "https://www.youtube.com/watch?v=d96cjJhvlMA")!, isInWatchlist: false
            ),
            Movie(
                title: "Avengers: Age of Ultron",
                posterImage: "AvengersPoster",
                description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                rating: 7.3,
                duration: "2h 21min",
                genre: "Action, Adventure, Sci-Fi",
                releaseDate: "2015-05-01".date,
                trailer: URL(string: "https://www.youtube.com/watch?v=tmeOjFno6Do")!, isInWatchlist: false
            )
        ]
    }
    
    func toggleWatchList(_ movieID: String) {
        guard let movieIndex = movies.value.firstIndex(where: { $0.id == movieID }) else {
            return
        }
        movies.value[movieIndex].isInWatchlist.toggle()
    }
    
    func sortMovies(_ type: SortType) {
        switch type {
        case .name:
            movies.value = movies.value.sorted {
                $0.title < $1.title
            }
        case .releaseDate:
            movies.value = movies.value.sorted {
                $0.releaseDate < $1.releaseDate
            }
        }
    }
}
