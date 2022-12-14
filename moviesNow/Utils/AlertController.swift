//
//  AlertController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 10/12/22.
//

import Foundation
import UIKit

class CrearAlerta {
      static func alertaSimple(titulo:String, mensaje : String, color : UIColor) -> UIAlertController {
        let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.backgroundColor = color
        alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel))
        return alert
    }
    
    static func alertCustomCerrar(titulo:String, mensaje : String, color : UIColor) -> UIAlertController {
      let alert = UIAlertController(title: titulo, message:  mensaje, preferredStyle: .alert)
      alert.view.subviews.first?.subviews.first?.backgroundColor = color
      return alert
  }
    
    
}


