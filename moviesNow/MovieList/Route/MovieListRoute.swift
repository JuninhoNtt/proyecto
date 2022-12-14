//
//  MovieListRoute.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit




class MovieListRoute {
    var presenter:MovieListPresenter?
    var viewController:MovieViewController?
}

extension MovieListRoute : MovieListRouteProtocol {
    
    func selectMovieListItem(movieModel: MovieModel) {
        
        let itemMovieDetail = MovieDetail(id: movieModel.id, titulo: movieModel.titulo, fechaEstreno: movieModel.fechaEstreno, sinopsis: movieModel.sinopsis, rutaPoster: movieModel.rutaPoster, rating: movieModel.rating)
     
        let viewMovieDetail = MovieDetailConfigurator.makeView(itemMovieDetail)
        viewController?.navigationController?.pushViewController(viewMovieDetail, animated: true)

    }
    
}

