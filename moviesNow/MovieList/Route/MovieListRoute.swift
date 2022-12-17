//
//  MovieListRoute.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit




class MovieListRoute {
   weak  var presenter:MovieListPresenterInputProtocol?
    var view:UIViewController?
}

extension MovieListRoute : MovieListRouteProtocol {
    
    
    
    func selectMovieListItem(movieModel: MovieModel) {
        
        let itemMovieDetail = MovieDetail(id: movieModel.id, titulo: movieModel.titulo, fechaEstreno: movieModel.fechaEstreno, sinopsis: movieModel.sinopsis, rutaPoster: movieModel.rutaPoster, rating: movieModel.rating)
     
        let viewMovieDetail = MovieDetailConfigurator.makeView(itemMovieDetail)
        
       view?.navigationController?.pushViewController(viewMovieDetail, animated: true)

    }
    
    func showAlertDialog() {
        
        DispatchQueue.main.async {
            let alert = CrearAlerta.alertaSimple(titulo: "Aviso", mensaje: "tuvimos un problema al mostrar la lista", color: UIColor.white)
            self.view?.present(alert, animated: true)
            self.presenter?.showAlertMovieList()

        }
       
          

    }
    
}

