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
    
    private var movieId : Int
    
     // init(movieId: Int) {
       // self.movieId = movieId
    //}
    
    init() {
      self.movieId = 2
  }
    

}

extension RatePresenter : RatePrenseterProtocol {
    func setRateMovie(rating: String) {
            if let rating = Int(rating){
                let ratingMovie = Rate(value: rating)
               interactor?.setRateMovie(movieID: movieId, rate: ratingMovie)
            }
    }
    
    func showRateResponse(message: RateResponseModel) {
            route?.showRateMessage(rateResponseModel: message)
    }
    
    func showRateError(message : String) {
        route?.showRateError(message: message)
    }
    
}
