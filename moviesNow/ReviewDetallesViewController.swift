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
    
    var review:Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setup(review: review)

    }
    
    private func setup(review:Review?){
        if let review = review {
            reviewLabel.text = review.content
            autorLabel.text = review.author
            rateLabel.text = "9"
        }
    }
}
