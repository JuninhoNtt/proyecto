//
//  MovieListInteractor.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation



class MovieListInteractor {
    var presenter: MovieListPresenterOutputProtocol?
    var api = MovieManager()
}

extension MovieListInteractor: MovieListInteractorProtocol {
    
    func getListMovies() {
        api.delegate = self
        api.fetchMovie()
    }
    
}

extension MovieListInteractor : MovieManagerDelegate {
    
    func didUpdateMovies(_ movieManager: MovieManager, moviesResponse: [MovieResponse]) {
        var listMovieModel = [MovieModel]()
        for movie in moviesResponse {
            let movieModel = MovieModel(movieResponse: movie)
            listMovieModel.append(movieModel)
        }
        
        presenter?.setMovieList(listMovies: listMovieModel)
    }
    
    func didFailWithError(error: Error) {
        print("error con el api")
    }
    
}
