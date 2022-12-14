//
//  RatePresenter.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation



class RatePresenter {
    
    var interactor:RateInteractorProtocol?
    var route:RateRouteProtocol?
    var movieId : Int
    
     required init(movieId: Int) {
        self.movieId = movieId
    }
    

}

extension RatePresenter : RatePrenseterProtocol {
    func setRateMovie(rateModel: Rate) {
        interactor?.setRateMovie(movieID: movieId, rate: rateModel)

    }
    
    func showRateResponse(message: RateResponseModel) {
        route?.showRateMessage(rateResponseModel: message)
    }
    
    func showRateError(message : String) {
        route?.showRateError(message: message)
    }
    
}
