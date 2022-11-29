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
    Movie(titulo: "superman", valoracion: "me parece una mala pelicula"),
    Movie(titulo: "el padrino", valoracion: "para ver en familia"),
    Movie(titulo: "titanic", valoracion: "pelicula aburrida"),
    Movie(titulo: "cars", valoracion: "mal cgi"),
    Movie(titulo: "el padrino 2", valoracion: "para ver un fin de semana"),
    Movie(titulo: "la mujer maravilla", valoracion: "buena peli"),
    Movie(titulo: "aquamman", valoracion: "buen cgi"),
    Movie(titulo: "radipos y furiosos", valoracion: "muchos autos")
    ]
}
