//
//  MovieListConfiguration.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit

class MovieListConfigurator {
   
    static func makeLista(view : MovieViewController)  {
       
       let presenter = MovieListPresenter()
       let interactor = MovieListInteractor()
       let route = MovieListRoute()
        
       view.presenter = presenter

       //prenseter
       presenter.view = view
       presenter.interactor = interactor
       presenter.route = route
        
       //interactor
       interactor.presenter = presenter
        
       //route
       route.presenter = presenter
       route.viewController = view
        
   }
   
}
