//
//  ReviewViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 29/11/22.
//

import UIKit



class RateViewController: UITableViewController {
    
    var delegate: ReviewViewControllerDelegate?
    @IBOutlet private weak var reviewTextField: UITextField!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var rateMovieStepper: UIStepper!
    
    
    var presenter: RatePrenseterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       confirationStepper()
    }

    @IBAction private func saveReviewButton(_ sender: UIBarButtonItem) {
        
        var texto = reviewTextField.text ?? ""
        let rateMovie = rateLabel.text ?? ""
        texto = texto.trimmingCharacters(in: .whitespacesAndNewlines)
      
        if !texto.isEmpty && !rateMovie.isEmpty{
          sendRateMovie(rate: rateMovie)
            
        }else{
            presenter?.showRateError(message: "te falta llenar campos" )
        }
    }
    
    @IBAction  private func rateMovieStepper(_ sender: UIStepper) {
        rateLabel.text = Int(sender.value).description
    }
    
   private func confirationStepper(){
       rateMovieStepper.autorepeat = true
       rateMovieStepper.isContinuous = true
       rateLabel.text = Int(rateMovieStepper.value).description
       rateMovieStepper.maximumValue = 10
       rateMovieStepper.minimumValue = 0
    }
    
    private func sendRateMovie(rate: String){
      
    if let rateMovie = Int(rate){
        presenter?.setRateMovie( rateModel: Rate(value: rateMovie))
    }else {
        presenter?.showRateError(message: "ocurrio un problema con el puntaje" )

    }
        
    }
    
}
