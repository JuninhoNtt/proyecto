//
//  MovieDetailConfigurator.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation
import UIKit

class MovieDetailConfigurator {
    
    
    static func makeView(_ itemMovieDetailProtocol : ItemMovieDetailProtocol) -> UIViewController {
        
        let presenter = MovieDetailPresenter(itemMovieDetailProtocol)

        let router = MovieDetailRouter()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        weak var view = storyBoard.instantiateViewController(withIdentifier: "DetallesController") as? DetallesController
        view?.presenter = presenter
        router.view = view
        presenter.router = router
        return view!
        
        
    }
    
    
    
}
