//
//  MovieDetailProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation


protocol ItemMovieDetailProtocol {
    
    var id: Int  {get}
    var titulo: String {get}
    var fechaEstreno: String {get}
    var sinopsis: String {get}
    var rutaPoster: String {get}
    var rating:Float {get}
    
}

protocol MovieDetailInputProtocol {
    
    func getMovie() -> MovieDetailModel
    
    func goToReviewList(_ idMovie : Int)
}

//presenter to router
protocol MovieDetailRouterProtocol {
    
    func showReviewList(_ idMovie : Int)
}



