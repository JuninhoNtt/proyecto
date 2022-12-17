//
//  RateInteractor.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation



class RateInteractor {
    weak var presenter: RatePrenseterProtocol?
    var api = RateManager()
}
extension RateInteractor : RateInteractorProtocol {
    func setRateMovie(movieID: Int, rate: Rate) {
        api.delegate = self
        api.fetchRate(movieID: String(movieID), rate: rate)
    }
  
}

extension RateInteractor : RateManagerDelegate {

    func didUpdateRate(_ rateManager: RateManager, rateResponseModel: RateResponseModel) {
        presenter?.showRateResponse(message: rateResponseModel)
        print("interactor didupdaterate:\(rateResponseModel.status_code)")
    }
    
    func didFailWithError(error: Error) {
        presenter?.showRateError(message: "error")
    }
   
}

