//
//  ReviewDetallesViewController.swift
//  moviesNow
//
//  Created by Juninho Augusto Chero Hinojosa on 7/12/22.
//

import UIKit

class ReviewDetallesViewController: UITableViewController {
    
    
    @IBOutlet private weak var reviewLabel: UILabel!
    @IBOutlet private weak var autorLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
   var presenter : ReviewDetailInputPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setup()

    }
    
    private func setup(){
        reviewLabel.text = presenter?.getReviewDetailDes().review
        autorLabel.text = presenter?.getReviewDetailDes().autor
        rateLabel.text = presenter?.getReviewDetailDes().rating?.description

    }
}
