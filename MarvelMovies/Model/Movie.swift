//
//  Movie.swift
//  MarvelMovies
//
//  Created by Tien Dao on 2022-11-09.
//

import SwiftUI

// MARK: Movie Model & Sample Movies
struct Movie: Identifiable,Equatable{
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
   Movie(movieTitle: "Black Panther", artwork: "Movie1"),
    Movie(movieTitle: "Doctor Strange", artwork: "Movie2"),
    Movie(movieTitle: "Guardians of the Galaxy", artwork: "Movie3"),
    Movie(movieTitle: "Spider Man No Way Home", artwork: "Movie4"),
    Movie(movieTitle: "Shang Chi", artwork: "Movie5"),
    Movie(movieTitle: "Thor Love and Thunder", artwork: "Movie6"),
    Movie(movieTitle: "The Avengers", artwork: "Movie7"),
]
