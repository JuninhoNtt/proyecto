//
//  RateRoute.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 11/12/22.
//

import Foundation
import UIKit



class RateRoute {
    var prenseter: RatePrenseterProtocol?
    var view :RateViewController?
    
}

extension RateRoute : RateRouteProtocol {
    
    func showRateMessage(rateResponseModel : RateResponseModel) {
        
        DispatchQueue.main.async {
            let alert = CrearAlerta.alertCustomCerrar(titulo: String(rateResponseModel.status_code), mensaje: rateResponseModel.status_message, color: UIColor.white)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: { action in
                self.view?.navigationController?.popViewController(animated: true)
            }))
            self.view?.present(alert, animated: true)
        }
        
    }
    
    func showRateError(message : String) {
        
            let alert = CrearAlerta.alertaSimple(titulo: "Comentar Pelicula", mensaje: message, color: UIColor.white)
            self.view?.present(alert, animated: true)
        
        
    }
    
}
