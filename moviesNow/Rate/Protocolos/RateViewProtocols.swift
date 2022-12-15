//
//  RateViewProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

//view
protocol itemRateProtocol{
    
    var idMovie:Int {get}
}


//view
protocol ReviewViewControllerDelegate{
    
    func reviewViewControllerDelegate(_ rateViewController: RateViewController, didCreateReview review : String)
}

//presenter
protocol RatePrenseterProtocol{
    
    func setRateMovie(review: String, rating : String)
    func showRateResponse(message : RateResponseModel)
    func showRateError(message : String)
}
//interactor
protocol RateInteractorProtocol{
    func setRateMovie(movieID : Int, rate : Rate)
    func getRateMovieResponse()
}
//rouuter
protocol RateRouteProtocol{
    func showRateMessage(rateResponseModel : RateResponseModel)
    func showRateError(message : String)
}
