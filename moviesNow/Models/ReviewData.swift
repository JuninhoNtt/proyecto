//
//  ReviewData.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 4/12/22.
//

import Foundation

struct ReviewData: Codable {
    let results: [Review]
}

struct Review : Codable {
    let author:String
   // let author_details:[AuthorDetails]?
    let content: String
   // let created_at : String
}

struct AuthorDetails: Codable {
    let name: String
    let uuserName: String
    let rating: Int
}

