//
//  MovieListConfiguration.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit

class MovieListConfigurator {
   
    static func makeLista() -> UIViewController  {
       
       let presenter = MovieListPresenter()
       let interactor = MovieListInteractor()
       let route = MovieListRoute()
        
        let st = UIStoryboard(name: "Main", bundle: nil)
        let view = st.instantiateViewController(withIdentifier: "MovieViewController") as? MovieViewController
        
        view?.presenter = presenter

       //prenseter
       presenter.view = view
       presenter.interactor = interactor
       presenter.route = route
        
       //interactor
       interactor.presenter = presenter
        
       //route
       route.presenter = presenter
       route.view = view
        
       return view!
        
   }
   
}
