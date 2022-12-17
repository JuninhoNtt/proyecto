//
//  MovieListPresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation




class MovieListPresenter{
    
    weak var view:MovieViewControllerProtocol?
    var interactor:MovieListInteractor?
    var route:MovieListRouteProtocol?
    
}

extension MovieListPresenter : MovieListPresenterInputProtocol{
    func showAlertMovieList() {
       // route?.showAlertDialog()
        view?.showErrorView()
    }
    
    //pedir al interactor las pelicuulas
    func getMovieList() {
        interactor?.getListMovies()
    }
    //seleccionar una pelicula
    func showMovieListItem(movieModel: MovieModel) {
        route?.selectMovieListItem(movieModel: movieModel)

    }
}

extension MovieListPresenter : MovieListPresenterOutputProtocol {
    func setErrorList() {
        route?.showAlertDialog()
       // view?.showErrorView()

    }
    
    //el interactor devuelve las peliculas
    func setMovieList(listMovies: [MovieModel]) {
        view?.showMovie(listMovies: listMovies)
    }
  
}

