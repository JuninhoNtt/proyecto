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
    func setRateMovie(review: String,rating: String) {
        
        let review = review.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !review.isEmpty {
            if let rating = Int(rating){
                let ratingMovie = Rate(value: rating)
                interactor?.setRateMovie(movieID: movieId, rate: ratingMovie)
            }else{
                showRateError(message: "rating no valido" )
            }
        }else{
            showRateError(message: "te falta llenar campos" )
        }

    }
    
    func showRateResponse(message: RateResponseModel) {
        route?.showRateMessage(rateResponseModel: message)
    }
    
    func showRateError(message : String) {
        route?.showRateError(message: message)
    }
    
}
