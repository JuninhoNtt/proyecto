//
//  MovieListProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

//view
protocol MovieViewControllerProtocol{
    //lo que debe mostar la view
    func showMovie(listMovies: [MovieModel])
}
//prenseter
//datos de ingreso
protocol MovieListPresenterInputProtocol{
    //datos que se van a pedir al presenter
    func getMovieList()
    //presenter to route
    func showMovieListItem(movieModel : MovieModel)
}
//datos de salida
protocol MovieListPresenterOutputProtocol{
    
    //presenter to view
    //datos que el presenter tiene que devolver
    func setMovieList(listMovies : [MovieModel])
}
//interactor
protocol MovieListInteractorProtocol{
    func getListMovies()
}

protocol MovieListRouteProtocol {
    func selectMovieListItem(movieModel : MovieModel)
}
