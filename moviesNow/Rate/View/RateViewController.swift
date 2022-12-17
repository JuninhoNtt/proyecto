//
//  ReviewViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 29/11/22.
//

import UIKit



class RateViewController: UITableViewController {
    
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var rateMovieStepper: UIStepper!
    
    var presenter: RatePrenseterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       confirationStepper()
    }

    @IBAction private func saveReviewButton(_ sender: UIBarButtonItem) {
        print("ayudaaaaaaa")
        let rateMovie = rateLabel.text ?? ""
        presenter?.setRateMovie(rating: rateMovie)
       
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
