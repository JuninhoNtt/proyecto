//
//  MovieData.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 1/12/22.
//

import Foundation

struct MovieData: Decodable {
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    let id:Int
    let overview: String
    let release_date: String
    let poster_path: String?
    let title: String
    let vote_average:Float
   
}

