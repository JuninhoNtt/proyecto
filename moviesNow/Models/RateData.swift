//
//  RateData.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation

struct Rate:Codable {
    let value : Int
}


struct RateResponse:Codable {
    let status_code: Int
    let status_message: String
    
}
