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
        reviewTextField.placeholder = "mi comentario de la pelicula"
       confirationStepper()
    }

    @IBAction private func saveReviewButton(_ sender: UIBarButtonItem) {
        
        let review = reviewTextField.text ?? ""
        let rateMovie = rateLabel.text ?? ""
        presenter?.setRateMovie(review: review, rating: rateMovie)
       
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
    
  
}
