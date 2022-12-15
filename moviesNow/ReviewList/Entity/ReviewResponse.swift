//
//  ReviewData.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 4/12/22.
//

import Foundation

struct ReviewData: Decodable {
    let results: [Review]
}

struct Review : Decodable {
    let author:String
    let author_details: AuthorDetails
    let content: String
}

struct AuthorDetails: Decodable {
    let name: String?
    //let username: String
     let rating: Float?
}

