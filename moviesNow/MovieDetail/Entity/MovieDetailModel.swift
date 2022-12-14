//
//  MovieDetailModel.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

struct MovieDetailModel : ItemMovieDetailProtocol {
    
    var id: Int
    var titulo: String
    var fechaEstreno: String
    var sinopsis: String
    var rutaPoster: String
    var rating: Float
  
     init(_ itemMovieDetail : ItemMovieDetailProtocol) {
         self.id = itemMovieDetail.id
         self.titulo = itemMovieDetail.titulo
         self.fechaEstreno = itemMovieDetail.fechaEstreno
         self.sinopsis = itemMovieDetail.sinopsis
         self.rutaPoster = itemMovieDetail.rutaPoster
         self.rating = itemMovieDetail.rating
    }
   
}

