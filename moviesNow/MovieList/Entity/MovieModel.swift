//
//  Movie.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import Foundation

struct MovieModel{
    let id: Int
    let titulo: String
    let fechaEstreno: String
    let sinopsis: String
    let rutaPoster: String
    let rating:Float
    
    init(movieResponse : MovieResponse) {
        self.id = movieResponse.id
        self.titulo = movieResponse.title
        self.fechaEstreno = movieResponse.release_date
        self.sinopsis = movieResponse.overview
        self.rutaPoster = movieResponse.poster_path ?? ""
        self.rating = movieResponse.vote_average
    }
    
}
