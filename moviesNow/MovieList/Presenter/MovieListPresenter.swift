//
//  MovieListPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation




class MovieListPresenter{
    
    var view:MovieViewControllerProtocol?
    var interactor:MovieListInteractor?
    var route:MovieListRoute?
    
}

extension MovieListPresenter : MovieListPresenterInputProtocol{
    func getMovieList() {
        interactor?.getListMovies()
    }
    func showMovieListItem(movieModel: MovieModel) {
        route?.selectMovieListItem(movieModel: movieModel)

    }
}

extension MovieListPresenter : MovieListPresenterOutputProtocol {
    
    func setMovieList(listMovies: [MovieModel]) {
        view?.showMovie(listMovies: listMovies)

    }
    
   
    
    
}

/*extension MovieListPresenter : MovieListPresenterProtocol {
   
    func getMovieList() {
        //get movie from interactor
        interactor?.getListMovies()
    }
    
    func setMovieList(listMovies: [MovieModel]) {
        //pass movielist to view
        view?.showMovie(listMovies: listMovies)
    }
    
    func showMovieListItem(movieModel: MovieModel) {
        //
        print("show movie list item")
        route?.selectMovieListItem(movieModel: movieModel)
    }
    
}*/
