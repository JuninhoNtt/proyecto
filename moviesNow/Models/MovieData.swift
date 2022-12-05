//
//  MovieData.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 1/12/22.
//

import Foundation

struct MovieData: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id:Int
    let overview: String
    let release_date: String
    let poster_path: String
    let title: String
    let vote_average:Float
   
}


