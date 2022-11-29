//
//  Movie.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 28/11/22.
//

import Foundation

struct Movie{
    
    var titulo:String
    var valoracion:String
}

extension Movie{
    
    static var dataMovie = [
    Movie(titulo: "batman", valoracion: "me parece una buena pelicula"),
    Movie(titulo: "superman", valoracion: "me parece una mala pelicula")
    ]
}
