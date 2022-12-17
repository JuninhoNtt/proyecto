//
//  RateRoute.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation
import UIKit



class RateRoute {
    weak var view :UIViewController?

     weak var prenseter: RatePrenseterProtocol?
    
}

extension RateRoute : RateRouteProtocol {
    
    func showRateMessage(rateResponseModel : RateResponseModel) {
        print("estoy en el router :\(rateResponseModel.status_message)")
        
       DispatchQueue.main.async {
           let alert = CrearAlerta.alertaSimple(titulo: String(rateResponseModel.status_code), mensaje: rateResponseModel.status_message, color: UIColor.white)
            self.view?.present(alert, animated: true)
        }
        
    }
    
    func showRateError(message : String) {
        
            let alert = CrearAlerta.alertaSimple(titulo: "Comentar Pelicula", mensaje: message, color: UIColor.white)
            self.view?.present(alert, animated: true)
        
        
    }
    
}
