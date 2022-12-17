//
//  MovieListProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

//view
protocol MovieViewControllerProtocol : AnyObject {
    //lo que debe mostar la view
    func showMovie(listMovies: [MovieModel])
    func showErrorView()
}
//prenseter
//datos de ingreso
protocol MovieListPresenterInputProtocol : AnyObject{
    //datos que se van a pedir al presenter
    func getMovieList()
    //presenter to route
    func showMovieListItem(movieModel : MovieModel)
    //mostrar alerta de error
    func showAlertMovieList()
}
//datos de salida
protocol MovieListPresenterOutputProtocol : AnyObject{
    //datos que el presenter tiene que devolver
    func setMovieList(listMovies : [MovieModel])
    func setErrorList()
    
}
//interactor
protocol MovieListInteractorProtocol : AnyObject{
    func getListMovies()
}

protocol MovieListRouteProtocol {
    func selectMovieListItem(movieModel : MovieModel)
    func showAlertDialog()
}
