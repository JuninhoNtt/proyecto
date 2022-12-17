//
//  RateViewProtocols.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 13/12/22.
//

import Foundation

protocol itemRateProtocol{
    
    var idMovie:Int {get}
}

protocol RateManagerDelegate : AnyObject{
    func didUpdateRate(_ rateManager: RateManager, rateResponseModel:  RateResponseModel)
    func didFailWithError(error: Error)
}


//presenter
protocol RatePrenseterProtocol : AnyObject{
    
    func setRateMovie(rating : String)
    func showRateResponse(message : RateResponseModel)
    func showRateError(message : String)
}
//interactor
protocol RateInteractorProtocol : AnyObject {
    func setRateMovie(movieID : Int, rate : Rate)
}
//rouuter
protocol RateRouteProtocol : AnyObject {
    func showRateMessage(rateResponseModel : RateResponseModel)
    func showRateError(message : String)
}
