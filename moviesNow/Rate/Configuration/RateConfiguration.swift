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
        let presenter = RatePresenter(movieId: idMovie.idMovie)
        let interactor = RateInteractor()
        let route = RateRoute()
        
        let view = UIStoryboard(name: "ReviewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RateViewController") as? RateViewController
        
        //presenter
       // presenter.view = view
        presenter.interactor = interactor
        presenter.route = route
        
        //view
        view?.presenter = presenter
        
        //interactor
        interactor.presenter = presenter
        
       //route
        route.prenseter = presenter
        route.view = view
        
        return view!
        
    }
    
    
    
}
