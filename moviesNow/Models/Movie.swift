//
//  Movie.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import Foundation

struct MovieModel{
    
    let titulo: String
    let fechaEstreno: String
    let sinopsis: String
    let rutaPoster: String
    let comentario: String
    let rating:String
    
}

extension MovieModel{
    
    static var pelicula = MovieModel(titulo: "ola", fechaEstreno: "12-12-22", sinopsis: "nada", rutaPoster: "ruuta", comentario: "buena pelicula", rating: "9.5")
  
}
