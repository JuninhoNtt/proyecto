//
//  MovieDetailPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation


class MovieDetailPresenter {
  

    private var movieDetailModel : MovieDetailModel
    var router : MovieDetailRouter?
    
    required init(_ itemMovieDetailProtocol : ItemMovieDetailProtocol) {
        self.movieDetailModel = MovieDetailModel(itemMovieDetailProtocol)
    }
 
}

extension MovieDetailPresenter : MovieDetailInputProtocol {
    
    func getMovie() -> MovieDetailModel {
        return movieDetailModel
    }
    
    func goToReviewList(_ idMovie: Int) {
        print("prenseter go to review list")
        router?.showReviewList(idMovie)
    }
 
}
