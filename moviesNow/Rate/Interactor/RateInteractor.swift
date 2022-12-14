//
//  RateInteractor.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation



class RateInteractor {
    var presenter: RatePrenseterProtocol?
    var api = RateManager()
}
extension RateInteractor : RateInteractorProtocol {
    func setRateMovie(movieID: Int, rate: Rate) {
        api.delegate = self
        api.fetchRate(movieID: String(movieID), rate: rate)
    }
    
   
    func getRateMovieResponse() {
        print("get rate movie response API")
    }
  
}

extension RateInteractor : RateManagerDelegate {

    func didUpdateRate(_ rateManager: RateManager, rateResponseModel: RateResponseModel) {
        presenter?.showRateResponse(message: rateResponseModel)
        print("interactor didupdateRAte")
    }
    

    
    func didFailWithError(error: Error) {
        print("interactor didfailWithError")
    }
   
}

