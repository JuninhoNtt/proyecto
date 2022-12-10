//
//  ReviewViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 29/11/22.
//

import UIKit

protocol ReviewViewControllerDelegate{
    
    func reviewViewControllerDelegate(_ reviewViewController: ReviewViewController, didCreateReview review : String)
}

class ReviewViewController: UITableViewController {
    
    var delegate: ReviewViewControllerDelegate?
    @IBOutlet weak var reviewTextField: UITextField!
    var rateManager = RateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rateManager.delegate = self
        rateManager.fetchRate()
        
        
        
    }

    @IBAction func saveReviewButton(_ sender: UIBarButtonItem) {
        
        var texto = reviewTextField.text ?? ""
        texto = texto.trimmingCharacters(in: .whitespacesAndNewlines)
        if !texto.isEmpty{
            delegate?.reviewViewControllerDelegate(self, didCreateReview: texto)
            navigationController?.popViewController(animated: true)
        }
    }
   
}

extension ReviewViewController : RateManagerDelegate {
    
    func didUpdateRate(_ rateManager: RateManager, mensaje: String) {
        DispatchQueue.main.async {
            let alerta = CrearAlerta().alertaSimple(titulo: "Api Response", mensaje: " Review Guardada", color: UIColor.white)
            self.present(alerta, animated: true)
        }
       
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            let alerta = CrearAlerta().alertaSimple(titulo: "Api Response", mensaje: "Error al guardar Review", color: UIColor.white)
            self.present(alerta, animated: true)
        }
      
    }
    
    
    
    
    
    
    
}
