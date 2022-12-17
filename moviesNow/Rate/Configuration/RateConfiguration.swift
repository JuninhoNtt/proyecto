//
//  RateConfiguration.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation
import UIKit

class RateConfiguration {
    
    
    static func RateConfigutionViper(_ idMovie : itemRateProtocol) -> UIViewController {
        
       // let presenter = RatePresenter(movieId: idMovie.idMovie)
        let presenter = RatePresenter()
        let interactor = RateInteractor()
        let route = RateRoute()
        
         var view = UIStoryboard(name: "ReviewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RateViewController") as? RateViewController
        
        //presenter
       // presenter.interactor = interactor
       // presenter.route = route
        
        //view
        view?.presenter = presenter
        
        //interactor
       //interactor.presenter = presenter
        
       //route
        route.view = view
        route.prenseter = presenter
        presenter.route = route
        presenter.interactor = interactor
        interactor.presenter = presenter

        
        return view!
        
    }
    
    
    
}
